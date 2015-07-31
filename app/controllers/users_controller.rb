class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_up!
    @user = User.new(params.require(:user).permit(:username, :password, :password_confirmation))
    if @user.save
      flash[:notice] = "Your account has been created!"
      redirect_to action: :sign_in

    else
      flash[:notice] = "Your account couldn't be created. Did you enter a unique username and password?"
      redirect_to action: :sign_up
    end
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      flash[:notice] = "This user doesn't exist!"
      redirect_to action: :sign_in
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      flash[:notice] = "Your password's wrong!"
      redirect_to action: :sign_in
    else
      flash[:notice] = "You're signed in, #{@user.username}!"
      session[:user] = @user
      redirect_to posts_path
    end
  end

  def sign_out
    flash[:notice] = "#{session[:user]["username"]} signed out!"
    session[:user] = nil
    redirect_to root_url
  end

end
