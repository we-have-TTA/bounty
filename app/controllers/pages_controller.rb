class PagesController < ApplicationController

  def index
    # TODO reduce sql query
    @posts = Post.includes(:comments).includes(:user)
  end
end
