class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    # @orders = Order.where(user_id: current_user.id)
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = params[:quantity].to_i * product.price

    tax_rate = 0.09

    calculated_tax = calculated_subtotal * tax_rate

    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      sub_total: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total
    )
    @order.save
    render 'order_show.json.jb'

  end

  def order_show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
