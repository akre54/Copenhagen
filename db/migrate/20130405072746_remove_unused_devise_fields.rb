class RemoveUnusedDeviseFields < ActiveRecord::Migration
  def change
    remove_column :users, :reset_password_token, :reset_password_sent_at, :confirmation_token, :confirmed_at,  :confirmation_sent_at,  :unconfirmed_email
  end
end
