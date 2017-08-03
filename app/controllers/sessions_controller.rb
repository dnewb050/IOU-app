class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:create, :new]
  skip_before_action :set_current_user, only: [:create, :new]

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to user_url(session[:user_id])
    else
      flash.now[:alert] = "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, alert: "Logged out"
  end
end
