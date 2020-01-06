require 'rails_helper'

RSpec.feature '説明管理機能', type: :feature do
  background do
    user = FactoryBot.create(:user)
    user2 = FactoryBot.create(:second_user)
    describe = FactoryBot.create(:describe, user: user)
    describe2 = FactoryBot.create(:second_describe, user: user2)
    describe3 = FactoryBot.create(:third_describe, user: user2)
    FactoryBot.create(:like, user: user, describe: describe3)

    visit new_user_session_path
    fill_in 'メールアドレス', with: 'aaa@aaa.com'
    fill_in 'パスワード', with: 'AAAAAA'
    click_button 'ログイン'
  end

  scenario '説明の一覧機能のテスト' do
  expect(page).to have_content '仮タイトル'
  expect(page).to have_content '仮説明'
  end

  scenario '説明の詳細機能のテスト' do
    click_link  '仮タイトル'

    expect(page).to have_content 'コンテント'
  end

  scenario '説明の投稿機能脳テスト' do
    click_link  '説明投稿'
    fill_in 'タイトル', with: '新規説明'
    fill_in '内容', with: '新規説明'

    click_button '登録する'

    expect(page).to have_content '新規説明'
  end

  scenario '説明の編集機能のテスト' do
    click_link  '仮タイトル'
    click_link '編集'
    fill_in 'タイトル', with: '新規説明'
    fill_in '内容', with: '新規説明'

    click_button '更新する'

    expect(page).to have_content '新規説明'
  end

  scenario '説明の削除機能のテスト' do
    click_link  '仮タイトル'
    click_link  '削除'

    expect(page).not_to have_content '仮タイトル'
  end

  scenario 'ユーザーごとの投稿一覧機能のテスト' do
    click_link 'マイページ'
    click_link '投稿一覧'

    expect(page).to have_content '仮タイトル'
    expect(page).not_to have_content '仮説明'
  end

  scenario '説明の操作制限のテスト'  do
    click_link  '仮説明'

    expect(page).not_to have_content '編集'
    expect(page).not_to have_content '削除'
  end

  scenario 'いいね機能のテスト'  do
    click_link  '仮説明'
    find('.unhurt').click

    expect(page).to have_content '1'
  end

  scenario 'いいね解除のテスト' do
    click_link  'AAA'
    find('.hurt').click

    expect(page).to have_content '0'
  end

  scenario 'コメント機能のテスト'  do
    click_link  '仮説明'
    fill_in 'comment_form', with: '仮コメント'
    click_button  'コメントする'

    expect(page).to have_content '仮コメント'
  end
end
