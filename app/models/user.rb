class User < ApplicationRecord
  has_and_belongs_to_many :bikes, join_table: "users_bikes"
end
