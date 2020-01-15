require 'rails_helper'

RSpec.describe User, type: :model do
  it 'nameが空ならバリテーションが通らない' do
    user = User.new(name: '', email: 'aaa@aaa.com', password: 'A' * 6, password_confirmation: 'A' * 6, profile_image: '')
    expect(user).not_to be_valid
  end

  it 'emailが空ならバリテーションが通らない' do
    user = User.new(name: '仮ユーザー', email: '', password: 'A' * 6, password_confirmation: 'A' * 6, profile_image: '')
    expect(user).not_to be_valid
  end

  it 'emailがフォーマットから外れていればバリテーションが通らない' do
    user = User.new(name: '仮ユーザー', email: 'a' * 10, password: 'A' * 6, password_confirmation: 'A'  * 6, profile_image: '')
    expect(user).not_to be_valid
  end

  it 'emailが重複していればバリテーションを通らない' do
    User.create(name: '仮ユーザー', email: 'aaa@aaa.com', password: 'A' * 6, password_confirmation: 'A' * 6, profile_image: '')
    user = User.new(name: '仮ユーザー2', email: 'aaa@aaa.com', password: 'B' * 6, password_confirmation: 'B' * 6, profile_image: '')
    expect(user).not_to be_valid
  end

  it 'passwordが空ならバリテーションが通らない' do
    user = User.new(name: '仮ユーザー', email: 'aaa@aaa.com', password: '', password_confirmation: '', profile_image: '' )
    expect(user).not_to be_valid
  end

  it 'パスワードが5文字以下ならバリテーションが通らない' do
    user = User.new(name: '仮ユーザー', email: 'aaa@aaa.com', password: 'A' * 5, password_confirmation: 'A' * 5, profile_image: '')
    expect(user).not_to be_valid
  end

  it "passwordとpassword_confirmationが異なるとバリテーションが通らない" do
    user = User.new(name: '仮ユーザー', email: 'aaa@aaa.com', password: 'A' * 6, password_confirmation: 'B' * 6, profile_image: '' )
    expect(user).not_to be_valid
  end

  it '全ての条件を満たしていればバリテーションが通る' do
    user = User.new(name: '仮ユーザー', email: 'aaa@aaa.com', password: 'A' * 6, password_confirmation: 'A' * 6, profile_image: '')
    expect(user).to be_valid
  end

end
