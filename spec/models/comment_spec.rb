require 'rails_helper'

RSpec.describe Comment, type: :model do
  current_user = User.create(name: '仮ユーザー', email: "aaa@aaa.com", password: "AAAAAA", password_confirmation: "AAAAAA")
  describe = Describe.create(title: '仮タイトル', content: '仮コンテント', images: '', user: current_user)

  it "contentが501文字以上ならバリテーションが通らない" do
    comment = Comment.new(content: 'A' * 501, user: current_user, describe: describe)
    expect(comment).not_to be_valid
  end

  it "contentが500文字以上ならバリテーションが通る" do
    comment = Comment.new(content: 'A' * 500, user: current_user, describe: describe)
    expect(comment).to be_valid
  end
end
