Rails.application.routes.draw do
  
  root to: 'dashboards#show'

   devise_for :users,
               controllers: {
                  registrations: 'registrations',
                  sessions: 'sessions'
               }
  
  resources :post
  resources :contents
end
