# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
USE_SEED = true
if USE_SEED
  p 'use seed'
  require 'faker'

  fake_net_user = -> (_) {
    {
      name: Faker::Internet.unique.username,
      email: Faker::Internet.unique.email
    }
  }
  user_list = Array(10.times).map!(&fake_net_user).each do |user|
    User.create(user)
  end
  # Faker::Restaurant
  #   method: description, name, review, type
  fake_post = -> (_) {
    {
      title: Faker::Restaurant.unique.name,
      content: Faker::Restaurant.unique.description
    }
  }
  post_list = Array(3.times).map!(&fake_post)
  User.all.sample(3).each do |user|
    user.posts.create(post_list.pop)
  end
  fake_comment = -> (_) {
    {
      content: Faker::Restaurant.unique.review
    }
  }
  comment_list = Array(15.times).map!(&fake_comment)
  users = User.all
  user_count = User.count
  Post.all.cycle.first(comment_list.size).each.with_index do |post, i|
    comment = Comment.new(comment_list.pop)
    users[i % user_count].comments << comment
    post.comments << comment
  end


else
  p 'not use seed'
end
