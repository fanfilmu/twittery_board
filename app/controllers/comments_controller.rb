class CommentsController < ApplicationController
  before_action :set_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: "Comment successfully created"
    else
      render :new
    end
  end

  private

  def set_commentable
    params.each do |key, value|
      if key =~ /(.+)_id$/
        @commentable = $1.classify.constantize.find(value)
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
