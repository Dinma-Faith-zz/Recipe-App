class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).includes(:user, :foods).order(created_at: :desc).map do |public_recipe|
      {
        id: public_recipe.id,
        name: public_recipe.name,
        user: public_recipe.user.name,
        description: public_recipe.description,
        food_items: public_recipe.recipe_foods.count,
        total_price: public_recipe.foods.map(&:price).sum
      }
    end
  end
end
