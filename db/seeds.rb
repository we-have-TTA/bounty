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

  # Create fake User
  def create_fake_users(n)
    fake_net_user = -> (_) {
      {
        name: Faker::Internet.unique.username,
        email: Faker::Internet.unique.email
      }
    }
    user_list = Array(n.times).map!(&fake_net_user).each do |user|
      User.create(user)
    end
  end

  create_fake_users(10)

  # Create fake Post
  # Faker::Restaurant
  #   method: description, name, review, type
  def create_fake_posts(n)
    fake_post = -> (_) {
      {
        title: Faker::Restaurant.unique.name,
        content: Faker::Restaurant.unique.description
      }
    }
    post_list = Array(n.times).map!(&fake_post)
    User.order(Arel.sql('RANDOM()')).first(n).each do |user|
      user.posts.create(post_list.pop)
    end
  end

  create_fake_posts(3)

  # Create fake Comment
  def create_fake_comments(n)
    fake_comment = -> (_) {
      Faker::Restaurant.unique.review
    }
    comment_list = Array(n.times).map!(&fake_comment)
    users = User.all
    comment_nums = comment_list.size / Post.count
    Post.all.each do |post|
      comment_nums.times do
        Comment.create(
          user: users.sample,
          post: post,
          content: comment_list.pop
        )
      end
    end
  end

  create_fake_comments(15)
else
  p 'not use seed'
end
