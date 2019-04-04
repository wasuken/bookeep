Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'journals#index'
  get '/users/sign_out', to: 'devise/sessions#destroy'
  get '/journal/update', to: 'journals#update_page'
  get '/api/v1/journal/graph', to: 'journals#graph_all'
  get '/graph', to: 'journals#graph_page'
  patch '/journal', to: 'journals#update'
  post '/journal', to: 'journals#create'
  delete '/journal', to: 'journals#delete'
end
