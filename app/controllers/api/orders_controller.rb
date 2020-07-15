class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      sub_total: product.price,
      tax: product.price *
    )
    @order.save
    render 'order_show.json.jb'
  end
    # sub_total
    # tax
    # total
end
