class UpdateLocationsSchema < ActiveRecord::Migration
  def change
    add_column :locations, :latlong, :string
    add_column :locations, :address, :string
    add_column :locations, :phone, :string
    add_column :locations, :hours, :string
    add_column :locations, :num_helmets, :integer
    remove_column :locations, :lat, :lng
  end
end
