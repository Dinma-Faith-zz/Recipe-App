class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user_id: @user)
    @recipe_foods = RecipeFood.all
    @foods = Food.where(user_id: @user)
    @recipes = Recipe.where(user_id: @user)
    @total = @recipes.map { |x| Recipe.total_value(x.id) }.reduce(:+)
    @food_count = 0
    @recipes.each do |recipe|
      recipe_foods = recipe.recipeFoods
      recipe_foods.each do |_food|
        @food_count += 1
      end
    end
  end
end
