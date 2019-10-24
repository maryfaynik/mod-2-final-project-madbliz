class UsersController < ApplicationController
    before_action :require_logged_in, only: %i[index show edit update destroy] 
    before_action :user_find, only: %i[show edit update destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        #This is all the user's favorited madlibs (through favorites)
        @madlibs= @user.madlibs

        @trinkets = @user.trinkets

        #these are all of the user's trinket_orders with placed status
        #@trinket_orders = @user.trinket_orders.select {|t_order| Order.find(t_order.order_id).placed == true}
        
        @orders = @user.orders.select {|order| order.placed == true}.last(3).reverse
    
        #these are the orders associated with placed trinket orders 
       # @orders = @trinket_orders.map {|t_o| Order.find(t_o.order_id)}.uniq

    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
           
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user.destroy
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :user_names, :password, :password_confirmation)
    end

    def user_find
        @user = User.find(params[:id])
    end
end
