Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root to: 'static#home'

	get 'signup', to: 'users#new'
	post 'signup', to: 'users#create'

	resources :users, except: [:new, :index]

  	get 'login', to: 'sessions#new'
  	post 'login', to: 'sessions#create'
  	delete 'logout', to: 'sessions#destroy'
  	get 'auth/:provider/callback', to: 'sessions#google'

  	resources :jobs 

  	resources :clients do
  		resources :jobs, only: [:index]
  	end

  	resources :categories, only: [:index, :show]

  	get '/borough' => 'clients#borough'

    get '/jobsortdate' => 'jobs#viewdate' 

end
