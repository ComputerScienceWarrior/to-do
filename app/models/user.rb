class User < ApplicationRecord
  has_many :lists, dependent: :destroy
  has_many :list_items, through: :lists

  validates :email, presence: true, uniqueness: true
  has_secure_password
end
