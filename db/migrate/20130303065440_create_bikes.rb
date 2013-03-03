class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :color
      t.text :condition
      t.integer :location

      t.timestamps
    end
  end
end
