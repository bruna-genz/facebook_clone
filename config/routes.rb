Rails.application.routes.draw do
  
 
  get 'comments/index'
  get 'comments/create'
  get 'comments/new'
  get 'comments/destroy'
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
  resources :likes
  resources :comments
end
