class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :describe
  counter_culture :describe
  has_many :replies, class_name: 'Comment', foreign_key: :reply_comment_id, dependent: :destroy

  validates :content, presence: true,  length: { maximum: 500 }

  scope :original_comment, -> {where(reply_comment_id: nil)}
end
