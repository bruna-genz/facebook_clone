Rails.application.routes.draw do
  
  root to: 'posts#index'
  get 'users/show', as: 'profile'
  get 'users/index', as: 'find_friends'

  devise_for :users,
              controllers: {
                registrations: 'registrations',
                sessions: 'sessions',
              }

  resources :posts
  resources :contents
end
