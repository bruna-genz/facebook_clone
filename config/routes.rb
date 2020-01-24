Rails.application.routes.draw do
  
 
  get 'friendship/new'
  get 'friendship/create'
  get 'friendship/index'
  get 'friendship/destroy'
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

  resources :posts do
    resources :likes
  end
end
