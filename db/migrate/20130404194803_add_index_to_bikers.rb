class AddIndexToBikers < ActiveRecord::Migration
  def change
    add_index :bikers, :netid, unique: true
  end
end
