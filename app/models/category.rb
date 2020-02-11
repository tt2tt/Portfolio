class Category < ApplicationRecord
  has_many :describe_categories, dependent: :destroy
  has_many :categories, through: :describe_categories
end
