class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table "checkouts" do |t|
      t.integer "user_id",    :null => false
      t.integer "bike_id", :null => false
      t.timestamps
    end

    add_index :checkouts, :user_id
    add_index :checkouts, :bike_id
  end
end
