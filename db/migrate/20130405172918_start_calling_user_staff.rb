class StartCallingUserStaff < ActiveRecord::Migration
  def change
    rename_column :checkouts, :user_id, :staffer_id
  end
end
