class UsersController < ApplicationController
  skip_before_action :require_valid_user!
  before_action :reset_session

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.library = Library.new
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'You have successfully created an account! Thank you for signing up!'
      redirect_to root_path
    else
      render 'users/new'
    end
  end

  def destroy
    # TODO: remove user and library
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
