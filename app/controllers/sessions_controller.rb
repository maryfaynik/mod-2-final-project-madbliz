class SessionsController < ApplicationController

  def new
    #renders login form
  end

  def create
    @user = User.find_by(user_name: params[:user][:username]) || User.new
    if @user.valid?
      # return head(:forbidden) unless @user.authenticate(params[:user][:password]) 
      #=> Need to inform user password is wrong
      unless @user.authenticate(params[:user][:password])  # Incorrect password case
        flash[:errors] = @user.errors.full_messages
        redirect_to login_path
      else  # Correct password and username case
        session[:user_id] = @user.id
        # This accounts for anywhere the user has been redirected from
        # where they needed to login or create a username
        session[:redirect_to] ||= user_path(@user)
        redirect_to session.delete(:redirect_to)
      end
    else  # Incorrect username/doesn't exist case
      flash[:errors] = @user.errors.full_messages
      redirect_to login_path
    end
  end

  def destroy
      session.delete :user_id
      redirect_to root_path
  end
end