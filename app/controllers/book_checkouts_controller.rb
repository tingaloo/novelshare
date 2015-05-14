class BookCheckoutsController < ApplicationController

  def create
    checkout_params = {
      user_id: current_user.id,
      book_id: params[:book_checkout][:book_id],
      return_deadline: Time.zone.now + 2.weeks,
    }
    @book_id = params[:book_checkout][:book_id]
    @book = Book.find(@book_id)
    @book.checkout_user_id = current_user.id
    @book.save
    # Book.find(:book_id).checkout_user_id = current_user.id;
    @book_checkouts = BookCheckout.create(checkout_params)
    #TODO ERROR HANDLING MESSAGES
    #flash[:error] = "Sorry, that book was unavailable."
    redirect_to books_path
  end

  def destroy

    # @book_checkout = BookCheckout.where(book_id: params[:book]).first
    # @book_checkout = BookCheckout.find(params[:book_id].inspect)
    @book_checkout = BookCheckout.find_by(book_id: params[:check])
    # @book_checkout = BookCheckout.where(book_id: params[:book_id]).first
    @book = Book.find(params[:check])
    @book.checkout_user_id = nil
    @book.save

    @book_checkout.destroy

    redirect_to books_path
  end

  def show
    @book_checkout = BookCheckout.find(params[:id])
  end


end
