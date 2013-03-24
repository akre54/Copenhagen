class AddReturnedAtColumn < ActiveRecord::Migration
  def change
    add_column :checkouts, :returned_at, :datetime
  end
end
