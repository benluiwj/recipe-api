Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users
  post '/login', to: "session#login"
  post '/signup', to: "users#create"
  get '/auto-login', to: "session#auto_login#"

  resources :recipes do
	resources :ingredients
	resources :procedures
  end
end
