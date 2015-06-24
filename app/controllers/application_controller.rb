class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

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

  def fetch_book
    @goodreadsbook = goodreads.book_by_title(@book.title)
  end

  def goodreadsinfo
    @goodreadsbook = goodreads.book_by_title(@book.title)
    @author = @goodreadsbook.authors.to_hash['author']
    @avg_rating = @goodreadsbook.average_rating
    @book_link = @goodreadsbook.link
    @rating_count = @goodreadsbook.ratings_count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

end
