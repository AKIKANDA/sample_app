class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
  	  @post = Post.new
  end
  def create
  	  @post = Post.new(post_params)
      #@post.save
      #redirect_to post_path(@post.id)
    if @post.save
      redirect_to @post, notice: 'titleを登録しました'
    else
      render :new
    end
  end
  def index
  	#@posts = Post.all
      @posts = Post.page(params[:page]).per(3)
  end
  def show
  	@post = Post.find(params[:id])
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  private
  def post_params
      params.require(:post).permit(:title, :body, :image,)
  end
end