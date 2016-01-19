Rails.application.routes.draw do
  resources :addresses
  resources :line_items
  resources :orders do
    get :push_example, on: :collection
  end
  resource :pages do
    get :home
  end
  resources :products
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users



  root 'pages#home'
end
