class SessionsController < ApplicationController

  def new
    #renders login form
  end

  def create
    @user = User.find_by(user_name: params[:user][:username]) || User.new(password_digest: (BCrypt::Password.create('')))
      flash[:errors] ||= []
      if !@user.authenticate(params[:user][:password]) # Incorrect password case
        flash[:errors] << "Password failed to authenticate"
        redirect_to login_path
      elsif params[:user][:username].empty?
        flash[:errors] << "Must enter a username"
        redirect_to login_path
      else  # Correct password and username case
        session[:user_id] = @user.id
        # This accounts for anywhere the user has been redirected from
        # where they needed to login or create a username
        session[:redirect_to] ||= user_path(@user)
        redirect_to session.delete(:redirect_to)
      end
  end

  def destroy
      session.delete :user_id
      redirect_to root_path
  end
end