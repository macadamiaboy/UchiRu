Rails.application.routes.draw do

  resources :schools, only: %i[index new create show]
  resources :students, only: %i[index, show]

  #get '/students', to: 'students#index'

  #get '/schools/new', to: 'schools#new'

  #post '/schools', to: 'schools#create'

  root 'schools#index'
  
end
