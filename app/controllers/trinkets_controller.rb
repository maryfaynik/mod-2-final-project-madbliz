class TrinketsController < ApplicationController
  def index
    @trinkets = current_user.trinkets
    @trinket_types = Trinket::PRODUCTS
    @madlibs = @trinkets.map(&:madlib)
  end
  
  def show
    @trinket = Trinket.find(params[:id])
    @trinket_types = Trinket::PRODUCTS
    @madlib = @trinket.madlib
    @orders = @trinket.orders
  end
end
