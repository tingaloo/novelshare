RSpec.describe BookCheckoutsController do

  describe "POST #create" do
    before :each do
      login_user
    end

     #     Failure/Error: post :create, book_checkout: FactoryGirl.attributes_for(:book_checkout)
     # NoMethodError:
     #   undefined method `checkout_user_id=' for nil:NilClass


    context "with User logged in" do
      it "doesn't checkout" do
        @book = create(:book)

        # undefined method `id' for nil:NilClass

        # book and user are not defined in rspec, defined as nil.
        # see book_checkout.rb
        post :create, book_checkout: FactoryGirl.attributes_for(:book_checkout)

      end
    end

    context "with User signed in" do
      it "does checkout" do
        expect{
          post :create, book_checkout: FactoryGirl.attributes_for(:book_checkout)
        }.to change(BookCheckout, :count)
      end
    end

  end
end
