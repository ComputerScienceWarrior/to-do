class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :list_items, through: :lists
end
