class Item < ApplicationRecord
  belongs_to :category, optional: true

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
end
