class SessionsController < ApplicationController

  def new
    #renders login form
    return redirect_to root_path if logged_in?
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

  def products
    
    @madlib = Madlib.find(params[:madlib_id])
    favorite = Favorite.find_by(user: current_user, madlib: @madlib)
    @trinkets = build_trinkets(favorite)
    
    
  end

  def add_to_cart
    trinket_ids = params[:trinket_ids]
  
    session[:cart] ||= []
    trinket_ids.each do |trinket_id|
      session[:cart] << trinket_id
    end

    redirect_to show_cart_path
  end

  def show_cart
    @trinket_ids = session[:cart] 

    if !@trinket_ids 
      @empty = true
    else 
      @trinkets = @trinket_ids.map {|id| Trinket.find(id)}

    end
    
  end

  def destroy
      session.delete :user_id
      redirect_to root_path
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