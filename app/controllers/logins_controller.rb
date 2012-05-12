class LoginsController < ApplicationController
  def create
      @user = User.login( params[:username], params[:password] )
      if @user
          #success
          session[:current_user_id] = @user.id
          flash[:notice] = "#{@user.username} is signed in"
          redirect_to root_path
      else
          #fail
          flash[:alert] = "Username/password combo not found!"
          redirect_to new_login_path
      end
  end

  def new
  end

  def destroy
      session[:current_user_id] = nil
      # only use flash when you are redirecting
      flash[:notice] = "Logged out"
      redirect_to new_login_path
  end
end
