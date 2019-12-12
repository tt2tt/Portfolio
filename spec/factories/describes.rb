FactoryBot.define do
  factory :describe, class: Describe do
    title {"仮タイトル"}
    content {"仮コンテント"}
    images { [ Rack::Test::UploadedFile.new(Rails.root.join('spec/factories/test.jpg'), 'spec/factories/test.jpg') ] }
  end
end
