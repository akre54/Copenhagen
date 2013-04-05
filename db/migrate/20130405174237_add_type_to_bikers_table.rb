class AddTypeToBikersTable < ActiveRecord::Migration
  def change
    add_column :bikers, :type, :string
  end
end
