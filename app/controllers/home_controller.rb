class HomeController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :redirect_logged_user

  def show
    @user = User.new
  end

  private

  def redirect_logged_user
    redirect_to library_path(@user.library) if logged_in?
  end
end
