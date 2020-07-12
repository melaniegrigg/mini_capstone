class Api::ProductsController < ApplicationController
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    else
      @products = Product.all
    end

    @products = @products.order(:id => :desc)

    # if params [:discount] == "true"
    #   @products = @products.where("price < 5")
    # else
    #   @products = Product.all
    # end

    if params[:sort] == "price" && params[:sort_order] == 'desc'
    @products = @products.order(:price => :desc)
    elsif params[:sort] == "price"
    @products = @products.order(:price)
    else
      @products = @products.order(:id)
    end
      render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      id: params[:id],
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description]
    )
    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    render 'show.json.jb'
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "You have successfully deleted the product."}
  end
end
