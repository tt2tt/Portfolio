class Describe < ApplicationRecord
  mount_uploaders :images, ImageUploader
end
