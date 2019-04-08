class Category < ApplicationRecord
  extend FriendlyId

  has_ancestry
  has_many :items, dependent: :nullify

  friendly_id :name, use: :slugged
  acts_as_list scope: '#{ancestry ? "ancestry = \'#{ancestry}\'" : \'ancestry IS NULL\'}'

  validates :name, presence: true
  validates :slug, uniqueness: true

  before_validation :downcase_slug

  private

  def downcase_slug
     slug.downcase! if slug.present?
  end
end
