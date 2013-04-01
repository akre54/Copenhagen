class CheckoutUserToBiker < ActiveRecord::Migration
  def change
    rename_column :checkouts, :user_id, :biker_id
  end
end
