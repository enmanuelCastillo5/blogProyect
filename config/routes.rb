Rails.application.routes.draw do
  get 'home/index'
  get "/bienvenida", to: "home#index"
end
