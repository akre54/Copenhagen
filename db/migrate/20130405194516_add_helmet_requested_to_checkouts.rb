class AddHelmetRequestedToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :helmet_requested, :boolean
  end
end
