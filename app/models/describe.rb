class Describe < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :title, presence: true,  length: { maximum: 100 }
  validates :content_or_images, presence: true

  mount_uploaders :images, ImageUploader

 ransacker :images do
    |parent| Arel::Nodes::InfixOperation.new('->', parent.table[:json_column], 'images')
  end

  private

  def content_or_images
    content.presence or images.presence
  end
end
