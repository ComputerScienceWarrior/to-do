class List < ApplicationRecord
  has_many :list_items, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :list_items, allow_destroy: true
end
