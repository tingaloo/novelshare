class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @book.cover_remote_url(goodreads.book_by_title(@book.title).image_url)

      redirect_to root_path, :notice => "Comment Saved"
    else
      # :notice => "Comment not saved"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:book_id, :quote, :user_id)
  end
end
