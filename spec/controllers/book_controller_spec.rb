RSpec.describe BooksController do

  describe "GET index" do
    it "assigns @books" do
      book = FactoryGirl.create(:book)
      get :index
      expect(assigns(:books)).to eq([book])
    end

    it "renders index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do

    before :each do
      login_user
    end

    it "should show" do
      book = create(:book)
      get :show, id: book.id
      expect(assigns(:book)).to eq(book)
    end

    it "renders #show view" do
      book=create(:book)
      get :show, id: book
      expect(response).to render_template :show
    end

    context "with no valid GoodReads book" do
      it "should redirect to root" do
        book=create(:book, :unindexed)
        get :show, id: book
        expect(response).to redirect_to root_path
      end
    end

  end

  describe "GET #new" do

    before :each do
      login_user
    end

    it "Assign title, author" do
      get :new
      expect(assigns(:current_user).books.first).to be_a_new(Book)
    end
  end

  describe "POST #create" do
    before :each do
      login_user
    end

    context "w/ user Signed Out" do
      it "doesn't create and redirects" do
        logout_user

        expect{
          post :create, book: FactoryGirl.attributes_for(:book)
        }.to_not change(Book, :count)

        expect(response).to redirect_to new_user_session_path
      end
    end

    context "w/ valid attributes" do
      it "does create a new book" do
        expect{
          post :create, book: FactoryGirl.attributes_for(:book)
          }.to change(Book, :count)

        expect(response).to redirect_to Book.last
      end
    end

    context "w/ invalid attributes" do
      it "doesnt create new book" do
      expect{
        post :create, book: FactoryGirl.attributes_for(:book, :invalid)
        }.to_not change(Book, :count)
      end

      it "re-renders new method" do
        post :create, book: FactoryGirl.attributes_for(:book, :invalid)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do

    # Before update, we must have user log in
    # and instantiate a book
    before :each do
      login_user
      @book = create(:book)
    end

    context "w/ Valid Attributes" do
      it "located the requested @book" do
        put :update, id: @book, book: FactoryGirl.attributes_for(:book)

        expect(assigns(:book)).to eq(@book)
      end

      it "changes @book attributes" do
        put :update, id: @book, book: FactoryGirl.attributes_for(:book, :updated)
        @book.reload
        expect(@book.title).to eq ("Wrong Girl")
        expect(@book.author).to eq ("Not Gillian")
      end

      it "redirect to updated book" do
        put :update, id: @book, book: FactoryGirl.attributes_for(:book, :updated)
        expect(response).to redirect_to @book
      end
    end

    context "w/ invalid attributes" do
      it "locates the requested @book" do
        put :update, id: @book, book:FactoryGirl.attributes_for(:book)

        expect(assigns(:book)).to eq(@book)
      end

      it "does not change @book attributes" do
        put :update, id: @book, book: FactoryGirl.attributes_for(:book, :invalid)

        @book.reload
        expect(@book.title).not_to eq("Wrong Girl")
        expect(@book.author).not_to eq("Not Gillian")
      end

      it "rerenders edit page" do
        put :update, id: @book, book: FactoryGirl.attributes_for(:book, :invalid)
        @book.reload
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      login_user
      @book = create(:book)
    end

    it "redirects to library" do
      delete :destroy, id: @book
      expect(response).to redirect_to books_path
      expect(flash[:notice]).to be_present
    end

    it "actually destroys the record" do
      delete :destroy, id: @book
      get :show, id: @book.id

      expect(response).to redirect_to root_path
      expect(flash[:alert]).to be_present
    end
  end












end
