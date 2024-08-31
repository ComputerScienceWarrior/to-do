class User < ApplicationRecord
  has_many :lists, dependant: :destroy
  has_many :list_items, through: :lists
end
