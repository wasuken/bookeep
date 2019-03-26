Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'journals#index'
  get '/users/sign_out', to: 'devise/sessions#destroy'
  get '/journal/update', to: 'journals#update_page'
  patch '/journal', to: 'journals#update'
  post '/journal', to: 'journals#create'
end
