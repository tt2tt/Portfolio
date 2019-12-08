class Describe < ApplicationRecord
  belongs_to :user

  validates :title, presence: true,  length: { maximum: 100 }
  validates :content_or_images, presence: true

  mount_uploaders :images, ImageUploader

  private

  def content_or_images
    content.presence or images.presence
  end
end
