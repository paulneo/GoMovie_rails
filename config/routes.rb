Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'movies#index'

  resources :movies
  resources :rent_movies
  namespace :admin do
    resources :movies
    resources :categories
    resources :genders
  end
end
