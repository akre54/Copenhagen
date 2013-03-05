class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :netid
      t.string :first_name
      t.string :last_name
      t.string :year_of_graduation
      t.string :email_address
      t.string :type

      t.timestamps
    end
  end
end
