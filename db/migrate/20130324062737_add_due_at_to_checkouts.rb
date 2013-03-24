class AddDueAtToCheckouts < ActiveRecord::Migration
  def change
    add_column :checkouts, :due_at, :datetime
  end
end
