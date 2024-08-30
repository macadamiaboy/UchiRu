Rails.application.routes.draw do

  #resources :schools, only %i[index]

  root 'schools#index'
  
end
