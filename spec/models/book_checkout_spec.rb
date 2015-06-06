require 'rails_helper'

RSpec.describe BookCheckout, type: :model do

  it "has a valid factory" do
    expect(create(:book_checkout)).to be_valid
  end

  describe "with no book" do
    it "should not #save_and_verify " do

      # User is going to save and verify a book checkout. The method gets called on Bookcheckout Controllers Create.

      book = build(:book)
      book.valid?
      expect(book).to be_valid
    end
  end


end
