class CreateUsersBikes < ActiveRecord::Migration[7.2]
  def change
    create_table :users_bikes do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :bike, null: false, foreign_key: true
      t.timestamps
    end
  end
end
