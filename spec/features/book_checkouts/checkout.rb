include Warden::Test::Helpers
Warden.test_mode!

# Feature: User delete
#   As a user
#   I want to delete my user profile
#   So I can close my account
feature 'Checkouts', :devise, :js do

  # after(:each) do
  #   Warden.test_reset!
  # end

  # Scenario: User can delete own account
  #   Given I am signed in
  #   When I delete my account
  #   Then I should see an account deleted message
  scenario 'user1 creates and user2 checkouts' do
    user = FactoryGirl.create(:user)
    test_user = FactoryGirl.create(:user, :test_user)

    login_as(user, :scope => :user)
    visit new_book_path
    fill_in('book_title', :with => "The Cat in the Hat")
    fill_in('book_author', :with => "Dr Seuss")
    click_button 'Share It!'
    logout(:user)

    login_as(test_user, :scope => :user)
    visit root_path
    find('.index-book').hover
    page.find('.button').click

    expect(BookCheckout.count).to eq(1)
  end

  scenario 'user cannot checkout, only remove' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)
    visit new_book_path
    fill_in('book_title', :with => "The Cat in the Hat")
    fill_in('book_author', :with => "Dr Seuss")
    click_button 'Share It!'
    visit root_path
    find('.index-book').hover
    page.find('.button').click
    expect(Book.count).to eq(0)
    expect(BookCheckout.count).to eq(0)
  end










end
