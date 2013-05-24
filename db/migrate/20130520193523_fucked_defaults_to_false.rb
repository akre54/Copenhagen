class FuckedDefaultsToFalse < ActiveRecord::Migration
  def change
  	change_column :bikes, :fucked, :boolean, default: false, null: false
  end
end
