class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def failure
    raise failure_message
  end

  def okta
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:oktastate] = request.env['omniauth.auth']['uid']
    redirect_to root_path
  end
end
