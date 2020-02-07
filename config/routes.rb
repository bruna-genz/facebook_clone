Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  
  root to: 'posts#index'
  get 'users/show', as: 'profile'
  get 'users/index', as: 'find_friends'

  devise_for :users,
              controllers: {
                registrations: 'registrations',
                sessions: 'sessions',
                omniauth_callbacks: 'users/omniauth_callbacks'
              }
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy'
  end

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
    post 'friendships/confirm', as: 'confirm_friendship'
    delete 'friendships/:id' => "friendships#inverse_destroy", as: 'delete_request'
  end


  
end
