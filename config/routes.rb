Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => redirect('/login')

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

  resources :users
  get '/users/:id/activation', to: 'users#activation', as: 'user_activation'
  get 'users/:id/debtor', to: 'users#debtor', as: 'debtor_requests'
  get 'users/:id/creditor', to: 'users#creditor', as: 'creditor_requests'

  resources :payments
end
