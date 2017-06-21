Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: 'static#home'

	get 'signup', to: 'users#new'
	post 'signup', to: 'users#create'

	resources :users, except: [:new, :index]

  	get 'login', to: 'sessions#new'
  	post 'login', to: 'sessions#create'
  	delete 'logout', to: 'sessions#destroy'

  	resources :jobs

end
