class Category < ApplicationRecord
  has_many :describe_categories, dependent: :destroy
  has_many :categories, through: :describe_categories

  validates :name, presence: true,  length: { maximum: 20 }
end
