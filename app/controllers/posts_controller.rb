class PostsController < ApplicationController

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
     params.require(:post).permit[:author, :title, :body]
  end
end
