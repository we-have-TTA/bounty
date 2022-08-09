class Post < ApplicationRecord
  belongs_to :user
  has_many :comments


  # Faker::Restaurant
  #   method: description, name, review, type
  def self.create_fake_posts(n)
    fake_post = -> (_) {
      {
        title: Faker::Restaurant.unique.name,
        content: Faker::Restaurant.unique.description
      }
    }
    post_list = Array(n.times).map!(&fake_post)
    User.sample(n).each do |user|
      user.posts.create(post_list.pop)
    end
  end

  def load_comments
    Comment.where(post: self).includes(:user).order(id: :desc)
  end
end
