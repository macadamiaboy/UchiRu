Rails.application.routes.draw do

  resources :schools, only: %i[index new create show] do
    resources :grades, only: %i[index] do
      resources :students
    end
  end

  resources :students, only: %i[index, show]

  namespace :api do
    namespace :v1 do
      resource :api_key, only: [:show]
    end
  end

  #get '/students', to: 'students#index'

  #get '/schools/new', to: 'schools#new'

  #post '/schools', to: 'schools#create'

  root 'schools#index'
  
end
