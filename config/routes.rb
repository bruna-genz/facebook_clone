Rails.application.routes.draw do
  
  root to: 'dashboards#show'

   devise_for :users,
               controllers: {
                  registrations: 'registrations',
                  sessions: 'sessions'
               }
  get 'dashboards/show' => 'posts#new'
  resources :posts
  resources :contents
end
