class ApplicationController < ActionController::Base
  before_action :authorize
  before_action :set_current_user
  protect_from_forgery with: :exception

  private

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in."
      end
    end

    def set_current_user
      @current_user = User.find(session[:user_id])
    end

end
