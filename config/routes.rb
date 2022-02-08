Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :reservations, only: %i[index show new create edit update]
  resources :dishes, only: %i[show new create edit update] do
    resources :selected_dishes, only: :create
  end
  get "chefs/:chef_id/dishes", to: "dishes#index", as: :chef_dishes
  get "/chefs", to:"pages#chefs", as: :chefs

  # Path que llegar al Dashboard de los chefs
  get "pages/chefs_dashboard", to: "pages#chefs_dashboard", as: :chefs_dashboard
  get "pages/chefs_dashboard", to:
end

# Rutas no utilizadas de momento:
# post "chefs/:chef_id/dishes", to: "dishes#create", as: :chef_create_dish
# get "/chefs/:chef_id/reservations/new", to: "reservations#new"
# get "chefs/:chef_id/dishes/new", to: "dishes#new", as: :chef_new_dish
# get "chefs/:id/dishes/:id", to: "dishes#show", as: :chef_show_dish
