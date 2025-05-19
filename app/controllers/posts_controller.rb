class PostsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      flash.now[:alert] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
