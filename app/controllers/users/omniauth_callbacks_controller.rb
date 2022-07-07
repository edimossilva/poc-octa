class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # def failure
  #   binding.pry
  #   set_flash_message! :alert, :failure, kind: OmniAuth::Utils.camelize(failed_strategy.name), reason: failure_message
  #   redirect_to after_omniauth_failure_path_for(resource_name)
  # end

  def okta
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:oktastate] = request.env['omniauth.auth']['uid']
    redirect_to root_path
  end
end
