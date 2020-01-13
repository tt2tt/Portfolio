require 'rails_helper'

RSpec.describe Describe, type: :model do
  current_user = User.create(name: '仮ユーザー', email: "aaa@aaa.com", password: "AAAAAA", password_confirmation: "AAAAAA")


  it "titleが空ならバリテーションが通らない" do
    describe = current_user.describes.build(title: '', content: '仮コンテント', images: '')
    expect(describe).not_to be_valid
  end

  it "titleが101文字以上ならバリテーションが通らない" do
    describe = current_user.describes.build(title: 'a' * 101, content: '仮コンテント', images: '')
    expect(describe).not_to be_valid
  end

  it "contentとimagesが両方からの場合バリテーションが通らない" do
    describe = current_user.describes.build(title: '仮タイトル', content: '', images: '')
    expect(describe).not_to be_valid
  end

  it "全ての条件を満たしていればバリテーションが通る" do
    describe = current_user.describes.build(title: '仮タイトル', content: '仮コンテント', images: '')
    expect(describe).to be_valid
  end
end
