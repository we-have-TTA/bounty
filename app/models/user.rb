class User < ApplicationRecord
  has_many :posts
  has_many :comments


  def self.create_fake_users(n)
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
end
