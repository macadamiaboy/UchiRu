Rails.application.routes.draw do

  resources :schools, only: %i[index new create show]

  root 'schools#index'
  
end
