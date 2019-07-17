class OrdersView
  def display_list(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1} - #{element.name}"
    end
  end

  def ask_index
    puts "Index?"
    print "> "
    gets.chomp.to_i - 1
  end
end
