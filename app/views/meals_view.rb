class MealsView
  def display_list(meals)
    meals.each do |meal|
      puts "#{meal.id} - #{meal.name} : #{meal.price}€"
    end
  end

  def ask_name
    puts "Name?"
    print ">"
    gets.chomp.capitalize
  end

  def ask_price
    puts "Price?"
    print ">"
    gets.chomp.to_f
  end

end
