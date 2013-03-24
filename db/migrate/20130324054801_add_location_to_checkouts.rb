class AddLocationToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :location_id, :integer, :null => false
    add_index :checkouts, :location_id
  end
end
