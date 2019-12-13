FactoryBot.define do
  factory :user, class: User do
    name {"仮ユーザー"}
    email {"aaa@aaa.com"}
    password {'AAAAAA'}
    password_confirmation {'AAAAAA'}
    profile_image {''}
  end
end
