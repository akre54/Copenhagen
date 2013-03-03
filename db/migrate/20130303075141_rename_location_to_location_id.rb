class RenameLocationToLocationId < ActiveRecord::Migration
  def change
    rename_column :bikes, :location, :location_id
  end
end
