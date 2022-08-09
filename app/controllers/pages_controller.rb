class PagesController < ApplicationController

  def index
    # TODO reduce sql query
    @posts = Post.includes(:comments).order(id: :desc)

    @comment = Comment.new

    @user = User.sample.last
  end
end
