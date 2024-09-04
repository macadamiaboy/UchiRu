Rails.application.routes.draw do

  resources :schools, only: %i[index show] do
    resources :grades, only: %i[index] do
      resources :students, only: %i[index]
    end
  end

  resources :students, only: %i[new create destroy show]

  root 'schools#index'
  
end
