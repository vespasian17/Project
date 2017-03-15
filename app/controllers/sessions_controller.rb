class SessionsController < ApplicationController
	def create
    auth = request.env["omniauth.auth"]
    session[:omniauth] = auth.except 'extra'
    user = User.sign_in_from_omniauth auth
    session[:user_id] = user.id
    if user.blocked
      session[:user_id] = nil
      session[:omniauth] = nil
      flash[:danger] = " User BLOCKED"
    else
      flash[:success] = "SIGNED IN"
    end
    redirect_to root_url
  end

  def destroy
   session[:user_id] = nil
   session[:omniauth] = nil
   redirect_to root_url
  end
end
