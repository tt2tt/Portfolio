# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user
20.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
               name: name,
               email: email,
               password: password,
               password_confirmation: password,
               )
end

# describe
20.times do |n|
  title = [*'A'..'Z'][rand(26)]
  content = '仮説明'
  user_id =  rand(1..2)
  Describe.create!(title: title,
               content: content,
               user_id: user_id,
               )
end

# comment
20.times do |n|
  content = '仮コメント'
  user_id =  rand(1..2)
  describe_id = rand(1..5)
  Comment.create!(
               content: content,
               user_id: user_id,
               describe_id: describe_id,
               )
end

# like
Like.create(user_id: 1, describe_id: 1)
Like.create(user_id: 2, describe_id: 1)
Like.create(user_id: 2, describe_id: 2)
Like.create(user_id: 2, describe_id: 3)
Like.create(user_id: 3, describe_id: 3)
