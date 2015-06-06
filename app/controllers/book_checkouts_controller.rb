class BookCheckoutsController < ApplicationController
  before_action :authenticate_user!


  def create
    checkout_params = {
      user_id: current_user.id,
      book_id: params[:book_checkout][:book_id],
      return_deadline: Time.zone.now + 2.weeks,
    }

    @book_checkout = BookCheckout.new(checkout_params)
    @book_checkout.save_and_verify

    #TODO ERROR HANDLING MESSAGES
    #flash[:error] = "Sorry, that book was unavailable."
    redirect_to books_path, :notice => "Checkout Successful"
  end

  def destroy

    @book_checkout = BookCheckout.find_by(book_id: params[:id])
    @book = @book_checkout.book
    @book.checkout_user_id = nil
    @book.available = true
    @book.save

    @book_checkout.destroy

    redirect_to :back, :notice => "Return Successful"
  end

  def show
    @book_checkout = BookCheckout.find(params[:id])
  end


end
