class Api::CartedProductsController < ApplicationController

  def index
    @carted_products = CartedProduct.where 
  end

  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    if @carted_product.save
      render "show.json.jb"
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
