class CreateBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :bikes do |t|
      t.text :bike_model
      t.integer :bike_price

      t.timestamps
    end
  end
end
