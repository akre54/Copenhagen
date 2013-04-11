class AddConditionNotesToCheckout < ActiveRecord::Migration
  def change
    add_column :checkouts, :notes, :text, null: false, default: ''
  end
end
