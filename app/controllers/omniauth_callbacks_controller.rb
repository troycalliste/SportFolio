class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
  def google_oauth2
      @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      # sign_in @user, :event => :authentication #this will throw if @user is not activated
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
    end
  end
end
