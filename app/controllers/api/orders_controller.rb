class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    #find the current users shopping cart
    carted_products = current_user.carted_products.where(status: "carted")
    #then go to each item in the shopping cart
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      #figure out how much that will cost
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    #add them all up
    tax_rate = 0.09

    tax = calculated_subtotal * tax_rate
    total = tax + calculated_subtotal

    @order = Order.new(
      user_id: current_user.id,
      subtotal: calculated_subtotal,
      tax: tax,
      total: total)
    @order.save

    carted_products.update_all(order_id: @order.id, status: "purchased")
    render 'show.json.jb'

  end

  def order_show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
