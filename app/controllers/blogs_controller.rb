class BlogsController < ApplicationController
  before_action :set_blog, only: [:edit, :update, :destroy, :toggle_status]
  before_action :set_page_title_action
  access all: [:show, :index], site_admin: :all

  # GET /blogs
  # GET /blogs.json
  def index
    case current_user.roles[0]
    when :site_admin
      @blogs = Blog.newest.page(params[:page]).per(5)
    else
      @blogs = Blog.published.newest.page(params[:page]).per(5)
    end
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @blog = Blog.includes(:comments).friendly.find(params[:id])

    @comment = Comment.new

    set_page_subtitle "Blogs - #{@blog.title}"
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  def toggle_status
    case @blog.status.to_sym
    when :draft
      @blog.update(status: :published)
    when :published
      @blog.update(status: :draft)
    end

    respond_to do |format|
      format.html { redirect_to @blog, notice: 'Blog was toggled.' }
    end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body)
    end

    def set_page_title_action
      set_page_subtitle "Blog"
    end
end
