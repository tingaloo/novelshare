class BookReturnsController < ApplicationController
  before_action :authenticate_user!

  def create
    return_params = {
      user_id: current_user.id,
      book_id: params[:book_checkout][:book_id],
      return_deadline: Time.zone.now + 2.weeks,
    }

    @book_return = BookReturn.new(return_params)
    # Are there return problems?
    # @book_checkout.save_and_verify

    #TODO ERROR HANDLING MESSAGES
    #flash[:error] = "Sorry, that book was unavailable."
    redirect_to books_path, :notice => "Return Successful"
  end

end
