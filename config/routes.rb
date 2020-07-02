Rails.application.routes.draw do
  namespace :api do
    get "/all_products" => "products#display_all"
    get "/first_product" => "products#first_product"
    get "/last_product" => "products#last_product"
    get "/any_product" => "products#any"
    get "/products_all/:products" => "products#any"
    post "/number_guess" => "products#guess"
  end
end
