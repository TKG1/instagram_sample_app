class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_url, success: t('.success', title: @post.title)
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), success: t('.success', title: @post.title)
    else
      flash.now[:danger] = ('.fail')
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to posts_path, success: t('.success', title: post.title)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :post_image)
  end
end
