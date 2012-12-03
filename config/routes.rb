Rolodecks::Application.routes.draw do
  root :to => 'contacts#index'
  resources :contacts
  resources :connections, only: [:index, :create]
  resources :sessions, only: [:create]
end
