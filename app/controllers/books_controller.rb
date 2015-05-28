class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :results, :about]
  require 'open-uri'

  # helper_method :airdrop

  def index

    # Put these in view layer.
    @total_books = Book.count
    @total_users = User.count
    # Put these in helper methods.
    @top_donor = User.order('books_count desc').first
    @bookworm = User.order('books_read desc').first

    @books = Book.order('available desc').map do |book|
      BookPresenter.new(book)
    end

  end

  def test_index
    @books = Book.order('available desc').map do |book|
      BookPresenter.new(book)
    end
  end

  def airdrop
    @airdrop = Airdrop.new(user: current_user)
    if @airdrop.save
      redirect_to root_path, :notice => "You have a new book!"
    else
      redirect_to root_path, :notice => "Airdrop quota reached."
    end
  end

  def show

    @book = Book.find(params[:id])
    begin
    @goodreadsbook = goodreads.book_by_title(@book.title)
    @author = @goodreadsbook.authors.to_hash['author']
    @avg_rating = @goodreadsbook.average_rating
    @book_link = @goodreadsbook.link
    @rating_count = @goodreadsbook.ratings_count
    rescue
      redirect_to root_path, :alert => "GoodReads couldn't find the associated book"
    end
    # @synopsis = truncate(@goodreadsbook.description.html_safe, :length =>100, :escape => false)


  end

  def new
    @book = current_user.books.build
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.build(book_params)


    if @book.save
      redirect_to @book, :notice => "Book Created"
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to books_path, :alert => "Book Removed"
  end



 private
    def book_params
      params.require(:book).permit(:title, :author, :book_checkout_user, :cover)
    end

end
