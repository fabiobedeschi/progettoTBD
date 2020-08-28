class CommentsController < ApplicationController
  before_action :find_book

  def create
    @comment = @book.comments.new(comment_params)
    @comment.user_id = @user.id
    flash[:error] = 'Some errors occurred, the comment was not added.' unless @comment.save
    redirect_to @book
  end

  def destroy
    @comment = @book.comments.find(params[:id])
    flash[:error] = "This comment can't be deleted." unless can_destroy? && @comment.destroy
    redirect_to @book
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def find_book
    @book = Book.find(params[:book_id])
  end

  def can_destroy?
    @user.is_admin || @comment.user_id == current_user.id
  end

end
