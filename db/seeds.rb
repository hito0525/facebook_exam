# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               )
end

10.times do |n|
  title = Faker::Name.title
  content = Faker::Lorem.paragraph
  user_id = Faker::Number.between(1, 10)
  Topic.create!(title: title, content: content, user_id: user_id)
  Comment.create!(topic_id: topic_id,
                  user_id: user_id,
                  content: content)
end
