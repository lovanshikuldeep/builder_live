Rails.application.routes.draw do
  get 'sellers/index'
  get 'sellers/create'
  get 'appointments/create'
  get 'appointments/index'
  get 'appointments/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :products, only:[:create,:index] 
      resources :appointments
    get '/redirect', to: 'appointments#redirect', as: 'redirect'
    get '/callback', to: 'appointments#callback', as: 'callback'
  end

  resources :sellers do
    get '/appointments/:appointment_id', to: 'sellers#appointments', as: 'appointments'
  end
  # post 'users/:id/products', to: 'products#create'
end
