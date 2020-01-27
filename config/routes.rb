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
  resources :likes
  resources :comments
  resources :friendships

  resources :posts do
    resources :likes
  end

  resources :users do
    resources :friendships
  end
end
