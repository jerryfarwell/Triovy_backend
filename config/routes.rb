Rails.application.routes.draw do
  resources :contacts
  resources :quotes
  get '/user/:id', to: 'users#show'                  # this allow us to see when user open is profile
  resources :users
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
  sign_in: 'login',
  sign_out: 'logout',
  registration: 'signup'
},
controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  passwords: 'users/password', 
  confirmations: 'confirmation'
}

get '/users/password/edit', to: 'users/passwords#edit'
put '/password', to: 'users/passwords#update'
resources :passwords, only: [:create, :edit, :update], param: :reset_password_token, controller: 'users/password'

# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
