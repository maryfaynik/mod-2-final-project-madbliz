class SessionsController < ApplicationController

    def new
        #renders login form
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        return head(:forbidden) unless @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
      end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end


  end