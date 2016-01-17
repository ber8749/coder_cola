Rails.application.routes.draw do
  resources :addresses
  resources :line_items
  resources :orders
  resources :products
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resource :pages do
    get :home
  end

  root 'pages#home'
end
