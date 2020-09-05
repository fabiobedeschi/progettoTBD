class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_valid_user!
  helper_method :current_user, :logged_in?

  def current_user
    @user = User.find_by_id(session[:user_id]) unless session[:user_id].blank?
  end

  def logged_in?
    !current_user.nil?
  end

  def require_valid_user!
    if current_user.nil?
      flash[:error] = 'You must be logged in to access that page!'
      redirect_to root_path
    end
  end

end
