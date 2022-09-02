class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :food_id, presence: true
  validates :recipe_id, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }, presence: true
end
