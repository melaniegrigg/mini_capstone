Rails.application.routes.draw do
  namespace :api do
    get "/all_products" => "products#display_all"
    get "/first_product" => "products#first_product"
    get "/"
  end
end
