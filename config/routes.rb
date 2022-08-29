Rails.application.routes.draw do
  resources :recipe_foods
  resources :recipes
  resources :foods
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
