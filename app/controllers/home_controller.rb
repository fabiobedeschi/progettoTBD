class HomeController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :redirect_logged_user

  def index
    @user = User.new
  end

  private

  def redirect_logged_user
    # TODO: redirect to library_path when implemented
    redirect_to books_path if logged_in?
  end
end
