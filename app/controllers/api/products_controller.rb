class Api::ProductsController < ApplicationController
  def display_all
    @the_products = Product.all
    render 'products.json.jb'
  end

  def first_product
    @first = Product.first
    render 'first_product.json.jb'
  end
  
end
