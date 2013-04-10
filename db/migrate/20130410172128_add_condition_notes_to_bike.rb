class AddConditionNotesToBike < ActiveRecord::Migration
  def change
    add_column :bikes, :notes, :text, null: false, default: ''
  end
end
