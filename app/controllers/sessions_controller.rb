class SessionsController < ApplicationController
  skip_before_action :require_valid_user!, except: [:destroy]

  def new; end

  def create
    @user = User.find_by(username: session_params[:username])

    if @user&.authenticate(session_params[:password])
      # Store authenticated user_id in a cookie
      session[:user_id] = @user.id
      flash[:success] = 'Welcome back!'
      redirect_to root_path
    else
      flash[:error] = 'Invalid username/password combination'
      redirect_to sign_in_path
    end
  end

  def destroy
    # Destroy cookie and logout
    reset_session
    redirect_to root_path
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
