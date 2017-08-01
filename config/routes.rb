Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'login' => :destroy
  end


  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :requests
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
