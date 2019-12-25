class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :describe

  validates :content, presence: true,  length: { maximum: 500 }
end
