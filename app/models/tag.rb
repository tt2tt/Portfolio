class Tag < ApplicationRecord
  belongs_to :user
  has_many :describe_tags, dependent: :destroy
  has_many :describes, through: :describe_tags

  validates :name, presence: true,  length: { maximum: 20 }
end
