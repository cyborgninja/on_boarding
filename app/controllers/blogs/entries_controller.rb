class Blogs::EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :destroy]

  def index
    @blog = Blog.find(params[:blog_id])
    @entries = @blog.entries
  end

  def show
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:id])
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = Entry.new
  end

  def edit; end

  def create
    @entry = Entry.new(create_params)
    if @entry.save
      redirect_to controller: :entries, action: :index
    else
      redirect_to controller: :entries, action: :new
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { head :no_content}
      end
    end
  end

  def destroy
    @entry.destroys
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'entry was successfully destroyed' }
      format.json { head :not_content }
    end
  end

  private
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def entry_params
      params.require(:entry).permit(:title, :body)
    end

    def create_params
      params.require(:entry).permit(:title, :body).merge(blog_id: params[:blog_id])
    end
end
