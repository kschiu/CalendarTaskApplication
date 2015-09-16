class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    '/tasks#index'
  end

    def signup()
        redirect_to "/users/auth/google_oauth2"
    end
end
