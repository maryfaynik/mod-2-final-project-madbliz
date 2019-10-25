class FavoritesController < ApplicationController
    def create
        #IF NOT LOGGED IN, REDIRECT TO LOGIN PAGE
        if !session[:user_id]
            session[:current_fave] = Madlib.find(params[:id].to_i)

            #sets return_to to where I am (this specfic madlib)
            session[:redirect_to] ||= request.referer
            redirect_to login_path

        #If logged in, create and add this to your favorites
        else
            Favorite.find_or_create_by(madlib_id: params[:id].to_i, user_id: current_user.id)
            redirect_to user_favorites_path(current_user)
        end

    end

    def index
        @favorites = current_user.favorites
        @madlibs = @favorites.map {|favorite| favorite.madlib}

    end

    def destroy
        favorite = Favorite.find(params[:id])
        flash[:errors] ||= []
        flash[:errors] << "You've bought something from this favorite!"
        return redirect_to user_favorites_path(current_user) unless favorite.trinkets.empty?
        flash[:errors] = nil
        Favorite.destroy(params[:id])
        redirect_to user_path(current_user)
    end

    private

    def has_trinket?
        !!trinkets
    end
end
