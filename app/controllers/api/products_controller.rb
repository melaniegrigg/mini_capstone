class Api::ProductsController < ApplicationController
  def display_all
    @products = Product.all
    render 'products.json.jb'
  end

  def first_product
    @products = Product.first
    render 'first_product.json.jb'
  end

  def last_product
    @products = Product.last
    render 'last_product.json.jb'
  end

  def any
    product_id = params['products']
    @products = Product.find_by(name: product_id)
    render 'query_parameter.json.jb'
  end

  def segment_param
    product_id = params['all_product']
    @products = Product.find_by(name: product_id)
    render 'segment_parameter.json.jb'
  end
end
