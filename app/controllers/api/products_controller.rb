class Api::ProductsController < ApplicationController
  def display_all
    @the_products = Product.all
    render 'products.json.jb'
  end
end
