require 'googleauth/stores/redis_token_store'

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2

    # if params[:code]
    #   puts "============there is a code====================="
    #   puts params[:code]

    # end

    @user = User.from_omniauth(request.env["omniauth.auth"])
    puts "======find for google======"
    puts request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      session[:user_id] = @user.id
      sign_in_and_redirect @user, :event => :authentication
    else
      puts "=========nope nope nope========="
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
