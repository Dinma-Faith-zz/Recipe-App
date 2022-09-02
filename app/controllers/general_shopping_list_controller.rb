class GeneralShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user_id: @user)
    @recipe_foods = RecipeFood.all
    @foods = Food.where(user_id: @user)
    @recipes = Recipe.where(user_id: @user)
    @total = @recipes.map { |x| RecipeFood.where(recipe_id: x.id).map { |y| y.quantity * y.food.price }.sum }.sum
    @food_count = 0
    @recipes.each do |recipe|
      recipe_foods = RecipeFood.where(recipe_id: recipe.id)
      recipe_foods.each do |_food|
        @food_count += 1
      end
    end
  end
end
