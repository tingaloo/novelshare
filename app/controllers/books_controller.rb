class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :results, :about]
  require 'open-uri'

  def index

    # Fetches top donor/reader
    leaderboards

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
      # fetches GoodReads information
      goodreadsinfo
    rescue
      redirect_to root_path, :alert => "GoodReads couldn't find the associated book."
    end

  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :alert => "Record not found."
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

    redirect_to books_path, :notice => "Book Removed"
  end



 private
    def book_params
      params.require(:book).permit(:title, :author, :book_checkout_user, :cover)
    end

end
