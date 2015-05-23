require 'rails_helper'

RSpec.describe BookCheckout, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

  it "has a valid factory" do
    expect(create(:book_checkout)).to be_valid
  end

  it "saves and verifies" do

    # User is going to save and verify a book checkout. The method gets called on Bookcheckout Controllers Create.

    book = build(:book, title: nil)
    book.valid?
    expect(book).to be_invalid
  end

  #   def save_and_verify
  #   # make sure book attributes are valid
  #   ActiveRecord::Base.transaction do
  #     save

  #     book.checkout_user_id = user.id
  #     book.available = false
  #     book.save

  #     user.books_read += 1
  #     user.save
  #   end
  # end
