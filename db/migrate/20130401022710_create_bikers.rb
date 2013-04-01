class CreateBikers < ActiveRecord::Migration
  def change
    create_table :bikers do |t|
      t.string :first_name
      t.string :last_name
      t.string :netid
      t.string :email
      t.string :affiliation
      t.integer :year_of_graduation

      t.timestamps
    end

    remove_column :users, :first_name, :last_name, :netid, :affilition, :year_of_graduation
  end
end
