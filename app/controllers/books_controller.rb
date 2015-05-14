class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :results]

  def index
    @total_books = Book.count
    @top_donor = User.order('books_count desc').first
    # @donor = book.user.email
    # @book_worm = User.order('books_read desc').first
    # Before checkout, books are wrapped in /presenter


    @books = Book.all.map do |book|
      BookPresenter.new(book)
    end
  end

  def show

    @book = Book.find(params[:id])

    @goodreadsbook = goodreads.book_by_title(@book.title)
    @author = @goodreadsbook.authors.to_hash['author']
    # list = flickr.photos.search :text => @book.title, :sort => "relevance"
    @avg_rating = @goodreadsbook.average_rating
    @book_link = @goodreadsbook.book_link

    # @synopsis = truncate(@goodreadsbook.description.html_safe, :length =>100, :escape => false)
    @rating_count = @goodreadsbook.ratings_count
    @user_name = current_user.name
  end

  def test
    gon.push({
      :count => Book.count
      })
  end

  def search

  end

  def results
    # @search = params[:search]

    # @goodreadsbook = goodreads.book_by_title(@search["search"])

    # @author = @goodreadsbook.authors.to_hash['author']
    # @isbn = @goodreadsbook.isbn

    # @widget = (adjust_width(@goodreadsbook.reviews_widget)).html_safe
    # @googlebook = JSON.load(open("https://www.googleapis.com/books/v1/volumes?q=isbn:"+@isbn))

    # @avg_rating = @goodreadsbook.average_rating
    # @book_link = @goodreadsbook.book_link
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
      redirect_to @book
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

    redirect_to books_path
  end


 private

    def book_params
      params.require(:book).permit(:title, :author, :book_checkout_user)
    end
end
