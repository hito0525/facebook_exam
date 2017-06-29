# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 10.times do |n|
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(email: email,
#                password: password,
#                password_confirmation: password,
#                )
# end

# 10.times do |n|
#   title = Faker::Name.title
#   content = Faker::Lorem.paragraph
#   user_id = Faker::Number.between(1, 10)
#   Topic.create!(title: title, content: content, user_id: user_id)
# end


20.times do
email = Faker::Internet.email
name = Faker::LordOfTheRings.character
password = "password"
avatar = Faker::Avatar.image
user = User.new(
email: email,
name: name,
password: password,
password_confirmation: password,
avatar: avatar,
uid: SecureRandom.uuid,
)
user.skip_confirmation!
user.save
end

130.times do
  follower_id = [*1..20].sample
  followed_id = [*1..20].sample
  while follower_id == followed_id
    followed_id = [*1..20].sample
  end
    Relationship.find_or_create_by(
    follower_id: follower_id,
    followed_id: followed_id
  )
end

10.times do |m|
    title = Faker::Name.title
    content = Faker::LordOfTheRings.character
    user_id = [*1..10].sample
    Topic.create!(title:Faker::Name.title,
      content: Faker::Lorem.sentence,
                 user_id:user_id,
                 created_at: Time.now)
  end

# 10.times do
#   content = Faker::LordOfTheRings.character
#   user_id = [*1..10].sample
#   # Topic.create!(title: title, content: content, user_id: user_id)
#   Topic.create(
#   content: content,
#   user_id: user_id,
#   )
# end


20.times do
  user_id = [*1..10].sample
  topic_id = [*1..10].sample
  content = Faker::LordOfTheRings.character
  Comment.create!(
    user_id: user_id,
    topic_id: topic_id,
    content: content
  )
end
