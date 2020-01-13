FactoryBot.define do
  factory :describe, class: Describe do
    title {"仮タイトル"}
    content {"仮コンテント"}
    images {""}
  end

  factory :second_describe, class: Describe do
    title {"仮説明"}
    content {"仮内容"}
    images {""}
  end

  factory :third_describe, class: Describe do
    title {"AAA"}
    content {"AAA"}
    images {""}
  end
end
