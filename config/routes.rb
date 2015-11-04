Rails.application.routes.draw do
	delete 'logout', to: 'sessions#destroy', as: :logout

	get 'auth/twitter/callback', to: 'sessions#create'

	resources :tweets, only: :index

  get '/websocket', to: ActionCable.server

  root 'home#index'
end
