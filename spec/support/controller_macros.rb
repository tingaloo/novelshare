module ControllerMacros
   def login_user

      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      @current_user = user
      sign_in user

  end

  def login_test_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, :test_user)
      @current_user = user
      sign_in user
  end

  def logout_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      # puts @current_user.inspect
      sign_out @current_user
  end

  def logout_test_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_out @current_user
  end

end
