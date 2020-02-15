class Tag < ApplicationRecord
  belongs_to :user
  has_many :describe_tags, dependent: :destroy
  has_many :describes, through: :describe_tags
end
