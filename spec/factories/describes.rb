FactoryBot.define do
  factory :describe, class: Describe do
    title {"仮タイトル"}
    content {"仮コンテント"}
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }
  end

  factory :second_describe, class: Describe do
    title {"仮説明"}
    content {"仮内容"}
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }
  end

  factory :third_describe, class: Describe do
    title {"AAA"}
    content {"AAA"}
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }
  end
end
