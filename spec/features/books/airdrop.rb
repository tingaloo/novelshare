include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature '#Airdrop', :devise, :js do

  # after(:each) do
  #   Warden.test_reset!
  # end

  scenario 'user requests airdrop and navigates to it' do
    skip
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit root_path
    click_link 'AirDrop'
    # AirDrop creates a book.
    visit book_path(Book.last)
  end

  scenario 'visitor attempts to airdrop and redirects' do
    visit root_path
    click_link 'AirDrop'
    expect(Book.count).to eq(0)
    current_path.should == new_user_session_path
  end
end
