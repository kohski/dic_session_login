class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:title,:content))
    if @blog.save
      redirect_to blogs_path,notice: "created!"
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.new(params.require(:blog).permit(:title,:content))
    if @blog.save
      redirect_to blogs_path,notice: "editted!"
    else
      render edit
    end
  end


  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path,notice: "deleted"
  end

end
