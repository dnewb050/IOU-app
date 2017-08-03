Rails.application.routes.draw do
  root to: 'sessions#new'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destroy
  end


  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :requests

  put '/requests/:id/update_status', to: 'requests#update_status', as: 'request_status_update'
  get '/users/:id/activation', to: 'users#activation', as: 'user_activation'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
