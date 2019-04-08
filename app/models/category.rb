class Category < ApplicationRecord
  extend FriendlyId

  has_many :items, dependent: :nullify

  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :slug, uniqueness: true

  before_validation :downcase_slug

  private

  def downcase_slug
     slug.downcase! if slug.present?
  end
end
