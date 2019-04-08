class Item < ApplicationRecord
  extend FriendlyId

  belongs_to :category, optional: true

  friendly_id :name, use: :slugged
  mount_uploader :photo, PhotoUploader

  validates :name, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }
  validates :slug, uniqueness: true

  before_validation :downcase_slug

  private

  def downcase_slug
    slug.downcase! if slug.present?
  end
end
