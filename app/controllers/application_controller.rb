class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_login
    unless user_signed_in?
      respond_to do |format|
        format.html {
          redirect_to new_user_session_path,
          notice: 'You must be logged in first.'
        }
      end
    end
  end
end
