class Api::ProductsController < ApplicationController
  def display_all
    render 'products.json.jb'
  end
end
