Rails.application.routes.draw do
  
  get 'comments/index'
  get 'comments/create'
  get 'comments/new'
  get 'comments/destroy'
  get 'likes/create'
  get 'likes/new'
  get 'likes/destroy'
  root to: 'dashboards#show'
  get 'dashboards/profile', as: 'profile'
  get 'dashboards/friends_request', as: 'friends_request'
  get 'dashboards/find_friends', as: 'find_friends'

  devise_for :users,
              controllers: {
                registrations: 'registrations',
                sessions: 'sessions',
              }

  resources :posts
  resources :contents
end
