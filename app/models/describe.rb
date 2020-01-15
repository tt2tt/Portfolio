class Describe < ApplicationRecord
  belongs_to :user
  has_many :update_describes, class_name: 'Describe', foreign_key: :original_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true,  length: { maximum: 100 }
  validates :content_or_images, presence: true

  mount_uploaders :images, ImageUploader

 ransacker :images do
    |parent| Arel::Nodes::InfixOperation.new('->', parent.table[:json_column], 'images')
  end

  scope :original_describe, -> {where(original_id: nil)}
  scope :latest, -> {order(updated_at: :desc)}

  private

  def content_or_images
    content.presence or images.presence
  end
end
