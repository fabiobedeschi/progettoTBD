class UsersController < ApplicationController
  skip_before_action :require_valid_user!, except: %i[update destroy]
  before_action :find_user, only: %i[update destroy]
  before_action :reset_session, except: %i[update destroy]

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

  def update
    if @user.update(is_admin: true)
      flash[:success] = 'User promoted!'
    else
      flash[:error] = 'Cannot update this user!'
    end
    redirect_to @user.library
  end

  def destroy
    flash[:error] = 'Cannot delete this user!' unless destroy_user_and_library
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def destroy_user_and_library
    @user.library.books.each do |book|
      @user.library.books.delete(book)
    end
    @user.library.authors.each do |author|
      @user.library.authors.delete(author)
    end

    @user.destroy
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
