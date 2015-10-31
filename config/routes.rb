Rails.application.routes.draw do
	get    'login',  to: 'sessions#new',     as: :login
	delete 'logout', to: 'sessions#destroy', as: :logout

	get 'auth/twitter/callback', to: 'sessions#create'

	resources :tweets, only: :index

  root 'home#index'
end
