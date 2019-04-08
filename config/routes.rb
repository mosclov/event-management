Rails.application.routes.draw do
  resources :payments
  resources :events
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  get 'home/index'
  resources :notes
  resources :prospects
  get 'pastevents', to: 'events#past_events'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
