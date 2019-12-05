class Describe < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
end
