class AddManufacturerAndModel < ActiveRecord::Migration
  def change
    add_column :bikes, :manufacturer, :string
    add_column :bikes, :model, :string
  end
end
