class AddIndexToBikers < ActiveRecord::Migration
  def change
    add_index :bikers, :netid
  end
end
