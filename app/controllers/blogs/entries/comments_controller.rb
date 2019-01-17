class Blogs::Entries::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @entry = Entry.find(params[:entry_id])
    @comments = @entry.comments
  end

  def show
    @comments = @entry.comments
  end

  def new
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
    @comment = Comment.new
  end

  def edit; end

  def create
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
    @comment = Comment.new(create_params)
    if @comment.save
      NotificationMailer.send_confirmation_when_comment_created(@blog, @entry, @comment).deliver
      # NotificationMailer.send_confirmation.deliver
      redirect_to blog_entry_path(id: @entry.id)
    else
      redirect_to new_blog_entry_comment_path
    end
  end

  def update
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'comment was successfully updated.' }
        format.json { render :show, stauts: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { head :no_content}
      end
    end
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'comment was successfully destroyed' }
      format.json { head :not_content }
    end
  end

  def approve
    @blog = Blog.find(params[:blog_id])
    @entry = @blog.entries.find(params[:entry_id])
    @comment = @entry.comments.find(params[:id])
    @comment.update(status: Comment::COMMENT_STATUS_APPROVED)
    respond_to do |format|
      format.html { redirect_to blog_entry_path(@blog, @entry), notice: 'comment was approved.' }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

    def create_params
      params.require(:comment).permit(:body).merge(entry_id: params[:entry_id])
    end

end
