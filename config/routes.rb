Rails.application.routes.draw do
  
  root to: 'dashboards#show'
  get 'dashboards/profile', as: 'profile'
  get 'dashboards/friends_request', as: 'friends_request'

  devise_for :users,
              controllers: {
                registrations: 'registrations',
                sessions: 'sessions'
              }
  resources :posts
  resources :contents
end
