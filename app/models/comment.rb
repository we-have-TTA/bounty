class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post


  def self.create_fake_comments(n, options, posts = Post.all)
    fake_comment = -> (_) {
      Faker::Restaurant.unique.review
    }
    comment_list = Array(n.times).map!(&fake_comment)
    users = User.all
    comment_nums = comment_list.size / posts.count
    posts.all.each do |post|
      comment_nums.times do
        Comment.create(
          user: users.sample,
          post: post,
          content: comment_list.pop
        )
      end
    end
  end
end
