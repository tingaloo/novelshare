class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def goodreads
     @goodreads ||= Goodreads.new
  end

  def leaderboards
    @top_donor = User.order('books_count desc').first
    @bookworm = User.order('books_read desc').first
  end

  def goodreadsinfo
    @goodreadsbook = goodreads.book_by_title(@book.title)
    @author = @goodreadsbook.authors.to_hash['author']
    @avg_rating = @goodreadsbook.average_rating
    @book_link = @goodreadsbook.link
    @rating_count = @goodreadsbook.ratings_count
  end
end
