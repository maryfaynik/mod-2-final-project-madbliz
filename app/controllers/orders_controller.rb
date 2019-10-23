class OrdersController < ApplicationController
    before_action :require_logged_in, only: [:index, :create]

    def index
       
        @orders = current_user.orders.reverse
        
    end

    def create
    
        order = Order.create(user_id: current_user.id)
        trinks = params[:trinket_ids]
    

        if trinks.empty?
            order.destroy
            flash[:errors] = ["You Gotta Choose Some Trinkets, man"]
            redirect_to new_order_path(favorite_id: params[:favorite_id])
    
        else
            trinks.each do |trinket_id|
                TrinketOrder.create(trinket_id: trinket_id, order_id: order.id)
            end

            order.placed = true
            order.save
           
            redirect_to order_path(order)
        end

        #empty the cart
        session.delete :cart
      
        #Destroy trinkets that weren't orderd
        kill_trinkets = Trinket.all.select {|trinket| trinket.trinket_orders.empty?}
        kill_trinkets.each do |trink|
            Trinket.destroy(trink.id)
        end
        
       
    end

    def show
        
        @order = Order.find(params[:id])
        @user = @order.user

        #Make sure this orders page belongs to current_user
        flash[:errors] = ["You can't view that order"]
        return redirect_to root_path unless this_user?
        flash[:errors] = nil

        @trinkets = @order.trinkets
    end

    private

    def build_trinkets(fave)
        trinkets = []
        Trinket::PRODUCTS.each do |product, product_attr|
            trinkets << Trinket.create(product_type: product, favorite: fave, price: product_attr[:price] )
        end
        trinkets
    end
end
