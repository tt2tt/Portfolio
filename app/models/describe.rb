class Describe < ApplicationRecord
  belongs_to :user
  has_many :update_describes, class_name: 'Describe', foreign_key: :original_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :describe_categories, dependent: :destroy
  has_many :categories, through: :describe_categories
  has_many :describe_tags, dependent: :destroy
  has_many :tags, through: :describe_tags
  has_many :lnappropriates, dependent: :destroy

  validates :title, presence: true,  length: { maximum: 100 }
  validates :content_or_images, presence: true

  mount_uploaders :images, ImageUploader

  ransacker :images do
    |parent| Arel::Nodes::InfixOperation.new('->', parent.table[:json_column], 'images')
  end

  scope :original_describe, -> {where(original_id: nil)}
  scope :latest, -> {order(updated_at: :desc)}
  scope :likes_count, -> {order(likes_count: :desc)}

  private

  def content_or_images
    content.presence or images.presence
  end
end
