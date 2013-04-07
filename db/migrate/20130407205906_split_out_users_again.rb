class SplitOutUsersAgain < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Token authenticatable
      t.string :authentication_token

      # Copenhagen-specific
      t.string :netid, null: false
      t.integer :location_id
      t.boolean :admin, null: false, default: false

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, :netid,                unique: true
    add_index :users, :authentication_token, unique: true

    Biker.where(type: :User).each do |b|
      u = User.new(
        netid: b.netid,
        email: b.email,
        encrypted_password: b.encrypted_password,
        location_id: b.location_id,
      )
      u.password = "abcd12345"
      u.admin = b.admin
      raise "Something fucked up: #{u.errors.messages.join(', ')}" unless u.save
    end

    remove_column :bikers, :type, :location_id, :admin, :encrypted_password, :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :authentication_token
  end

  def down
    change_table(:bikers) do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Token authenticatable
      t.string :authentication_token

      # Copenhagen-specific changes
      t.integer :location_id
      t.boolean :admin, null: false, default: false
      t.string :type
    end

    add_index :bikers, :authentication_token, unique: true

    User.each do |u|
      b = Biker.find_by_netid(u.netid)
      raise "No existing user for #{u.netid}" unless b

      b.encrypted_password = u.encrypted_password
      b.location_id = u.location_id
      b.admin = u.admin
      raise "Something fucked up: #{b.errors.messages.join(', ')}" unless b.save
    end

    drop_table :users
  end
end
