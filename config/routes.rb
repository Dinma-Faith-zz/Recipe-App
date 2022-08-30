Rails.application.routes.draw do
  get 'public_recipes/index'
  root 'foods#index'

  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
