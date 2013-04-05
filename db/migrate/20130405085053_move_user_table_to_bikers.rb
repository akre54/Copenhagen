class MoveUserTableToBikers < ActiveRecord::Migration
  def change
    drop_table :users

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
    end

    add_index :bikers, :email,                unique: true
    add_index :bikers, :authentication_token, unique: true
  end
end
