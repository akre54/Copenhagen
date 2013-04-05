class AddUserToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :user_id, :integer
  end
end
