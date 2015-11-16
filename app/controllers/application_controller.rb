class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    protected
    def authorize
      unless Person.find_by_id(session[:user_id])
        redirect_to login_url, :alert => 'Please log in'
      end
    end

end
