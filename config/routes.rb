Rails.application.routes.draw do
  resources :discussion_threads, :as => 'threads'
  resources :boards do
    resources :boards
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'

  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  root 'boards#index'
end
