Rails.application.routes.draw do
  root 'foods#index'

  # resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  resources :users, only: [:index, :new, :create, :destroy] do
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:index, :new, :create, :destroy]
    end
  end


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
