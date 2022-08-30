Rails.application.routes.draw do
  root 'foods#index'

  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  resources :foods, only: [:index, :new, :create, :destroy]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
