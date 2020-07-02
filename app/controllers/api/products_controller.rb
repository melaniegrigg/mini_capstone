class Api::ProductsController < ApplicationController
  def display_all
    @the_products = Product.all
    render 'products.json.jb'
  end

  def first_product
    @first = Product.first
    render 'first_product.json.jb'
  end

  def last_product
    @last = Product.last
    render 'last_product.json.jb'
  end

  def query_param
    @message 
    render 'query_paramater.json.jb'
  end
end
