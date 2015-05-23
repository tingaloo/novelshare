include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'On Destroy, remove Checkouts', :devise, :js do

  after(:each) do
    Warden.test_reset!
  end

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'creates book' do

    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_book_path
    fill_in('book_title', :with => "The Cat in the Hat")
    fill_in('book_author', :with => "Dr Seuss")
    click_button 'Share It!'

    expect(page).to have_text("The Cat in the Hat")
  end


end




