Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reservations, only: %i[index show new create edit update]
  resources :dishes, only: %i[edit update]
  get "chefs/:id/dishes", to: "dishes#index", as: :chef_dishes
  get "chefs/:id/dishes/new", to: "dishes#new", as: :chef_new_dish
  post "chefs/:id/dishes", to: "dishes#create", as: :chef_create_dish
  get "chefs/:id/dishes/:id", to: "dishes#show", as: :chef_show_dish
  get "/chefs", to:"pages#chefs", as: :chefs
end
