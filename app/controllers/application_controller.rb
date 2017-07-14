class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      end

    private

    def user_not_authorized
      flash[:alert] = 'You are not authorized to do that'
      if current_user
        redirect_to(request.referrer || root_path)
      else
        redirect_to new_user_session_path
      end
    end
  end
