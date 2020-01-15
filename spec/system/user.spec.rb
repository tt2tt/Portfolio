require 'rails_helper'

RSpec.feature 'ユーザー管理機能', type: :feature do
  background do
    user = FactoryBot.create(:user)
    FactoryBot.create(:describe, user: user)
  end

  def login
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'aaa@aaa.com'
    fill_in 'パスワード', with: 'AAAAAA'

    click_button 'ログイン'

    expect(page).to have_content 'ログアウト'
  end

  scenario 'サインアップのテスト' do
    visit new_user_registration_path
    fill_in 'ユーザーネーム', with: '新規ユーザー'
    fill_in 'メールアドレス', with: 'bbb@bbb.com'
    fill_in 'パスワード', with: 'BBBBBB'
    fill_in '確認用パスワード', with: 'BBBBBB'
    click_button 'アカウント作成'

    expect(page).to have_content 'ログアウト'
  end

  scenario 'ログインのテスト' do
    visit new_user_session_path
    fill_in 'メールアドレス', with: 'aaa@aaa.com'
    fill_in 'パスワード', with: 'AAAAAA'
    click_button 'ログイン'

    expect(page).to have_content 'ログアウト'
  end

  scenario 'マイページのテスト' do
    login
    click_link 'マイページ'

    expect(page).to have_field 'ユーザーネーム',with:  '仮ユーザー'
    expect(page).to have_field 'メールアドレス', with: 'aaa@aaa.com'
  end

  scenario 'ユーザー変更機能のテスト' do
    login
    click_link 'マイページ'
    fill_in 'ユーザーネーム', with: '新規ユーザー'
    fill_in 'メールアドレス', with: 'bbb@bbb.com'
    click_button '更新する'

    expect(page).to have_field 'ユーザーネーム',with:  '新規ユーザー'
    expect(page).to have_field 'メールアドレス', with: 'bbb@bbb.com'
  end

  scenario 'パスワード変更機能のテスト' do
    login
    visit edit_user_registration_path

    fill_in '現在のパスワード', with: 'AAAAAA'
    fill_in 'パスワード', with: 'BBBBBB'
    fill_in '確認用パスワード', with: 'BBBBBB'
    click_button 'パスワードを変更する'
    click_link 'ログアウト'
    click_link 'ログイン'
    fill_in 'メールアドレス', with: 'aaa@aaa.com'
    fill_in 'パスワード', with: 'BBBBBB'
    click_button 'ログイン'

    expect(page).to have_content 'ログアウト'
  end

  scenario 'ログアウトのテスト' do
    login
    click_link 'ログアウト'

    expect(page).to have_content 'ログアウト'
  end

  scenario 'ユーザー削除機能のテスト' do
    login
    click_link 'マイページ'
    click_link 'ユーザーを削除'

    expect(page).to have_content 'ログイン'
  end

end
