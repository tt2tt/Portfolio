FactoryBot.define do
  factory :user, class: User do
    name {"仮ユーザー"}
    email {"aaa@aaa.com"}
    password {'AAAAAA'}
    password_confirmation {'AAAAAA'}
    profile_image {''}
  end

  factory :second_user, class: User do
    name {"仮ユーザー2"}
    email {"bbb@bbb.com"}
    password {'BBBBBB'}
    password_confirmation {'BBBBBB'}
    profile_image {''}
  end
end
