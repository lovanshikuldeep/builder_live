Rails.application.routes.draw do
  get 'appointments/create'
  get 'appointments/index'
  get 'appointments/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :products, only:[:create,:index]
    resources :appointments
  end
  
  # post 'users/:id/products', to: 'products#create'
end
