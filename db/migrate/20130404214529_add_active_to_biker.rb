class AddActiveToBiker < ActiveRecord::Migration
  def change
    add_column :bikers, :active, :boolean, null: false, default: true
  end
end
