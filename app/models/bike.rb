class Bike < ApplicationRecord
  has_many :users_bikes
  has_and_belongs_to_many :users, join_table: "users_bikes"
end
