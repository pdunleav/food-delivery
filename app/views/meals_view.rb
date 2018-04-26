class MealsView

  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} - #{meal.price}"
    end
  end

  def ask_for_name
    puts "name?"
    gets.chomp
  end

  def ask_for_price
    puts "price?"
    gets.chomp.to_i
  end
end
