class BlogsController < ApplicationController
  @@per_page = 3
  before_action :set_blog, only: [ :show, :edit, :update, :destroy ]

  def index
    @title = "All Blogs"
    @blogs = 
      Blog
        .all
        .paginate(page: params[:page], per_page: @@per_page)
  end

  def my_blogs
    @title = "My Blogs"
    @blogs = 
      current_user
      .blogs
      .paginate(page: params[:page], per_page: @@per_page)

    render :index
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = current_user.blogs.build(blog_params)

    if @blog.save
      redirect_to blogs_url, notice: 'Blog post is successfully created!'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_url, notice: "Blog post is successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog post is successfully destroyed!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
