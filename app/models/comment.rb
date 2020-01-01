class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :describe
  counter_culture :describe
  has_many :replies, class_name: 'Comment', foreign_key: :reply_comment_id, dependent: :destroy
  # has_many :reply,foreign_key: :reply_comment_id, class_name: "Comment", dependent: :destroy

  validates :content, presence: true,  length: { maximum: 500 }
end
