Rails.application.routes.draw do
  resources :users, only: [:show] do
  	member do
  		get 'dashboard'
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
