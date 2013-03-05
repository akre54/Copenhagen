class RenameTypeToAffilition < ActiveRecord::Migration
  def change
    rename_column :users, :type, :affilition
  end
end
