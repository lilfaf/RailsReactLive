Rails.application.routes.draw do
	get    'login',  to: 'sessions#new',     as: :login
	delete 'logout', to: 'sessions#destroy', as: :logout

	get 'auth/twitter/callback', to: 'sessions#create'

	resources :feed, only: :index do
		get :stream, on: :collection
	end

  root 'feed#index'
end
