module ControllerMacros
   def login_user

      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      @current_user = user
      sign_in user

  end

  def login_alt_user
    @request.env["devise.mapping"] = Devise.mappings[:user1]
      user = FactoryGirl.create(:user1)
      @current_user = user
      sign_in user
  end

  def logout_user
      @request.env["devise.mapping"] = Devise.mappings[:user]
      # puts @current_user.inspect
      sign_out @current_user
  end

end
