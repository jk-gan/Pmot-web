class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin_user!
    if current_owner.nil?
      redirect_to new_owner_session_path, alert: 'Must signed in first to view that page'
    else
      redirect_to new_owner_session_path unless current_owner.admin?
    end
  end
end
