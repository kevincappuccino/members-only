class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post was successfully created"
      redirect_to post_path(@post)
    else
      render 'new'
    end

  end


  private 
  def post_params
     params.require(:post).permit(:title, :body)
  end
end
