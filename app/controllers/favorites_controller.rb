class FavoritesController < ApplicationController

    def create
        #IF NOT LOGGED IN, REDIRECT TO LOGIN PAGE
        byebug
        if ! session[:user_id]
            session[:current_fave] = Madlib.find(params[:id].to_i)

            #sets return_to to where I am (this specfic madlib)
            session[:return_to] ||= request.referer

            redirect_to login_path
        else
            @user = User.find(session[:user_id])
            Favorite.create(madlib_id: params[:id].to_i, user_id: @user.id)

            redirect_to user_favorites(@user)

        end

    end

    def show
        @favorites = User.find(params[:id]).favorites
    end
end
