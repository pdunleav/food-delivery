require_relative "../views/meals_view"
require_relative "../models/meal"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @view.display_meals(meals)
  end

  def add
    name = @view.ask_for_name
    price = @view.ask_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end
