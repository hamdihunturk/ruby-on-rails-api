class CreateBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :bikes do |t|
      t.string :bike_model
      t.integer :bike_price

      t.timestamps
    end
  end
end
