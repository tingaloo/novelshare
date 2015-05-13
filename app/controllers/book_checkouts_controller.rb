class BookCheckoutsController < ApplicationController

  def create
    checkout_params = {
      user_id: current_user.id,
      book_id: params[:book_checkout][:book_id],
      return_deadline: Time.zone.now + 2.weeks,
    }
    @book_checkouts = BookCheckout.create(checkout_params)
    #TODO ERROR HANDLING MESSAGES
    #flash[:error] = "Sorry, that book was unavailable."
    redirect_to books_path
  end

  def destroy
    @book_checkout = BookCheckout.find(params[:id])
    @book_checkout.destroy

    redirect_to books_path
  end


end
