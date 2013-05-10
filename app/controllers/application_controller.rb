class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def require_login
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: 'You must be logged in first.' }
      end
    end
  end

  def require_admin
    unless current_user && current_user.admin?
      respond_to do |format|
        format.html { redirect_to bikes_path, notice: 'You are not authorized to perform that action.' }
      end
    end
  end
end
