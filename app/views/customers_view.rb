class CustomersView
  def display_list(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} : #{customer.address}"
    end
  end

  def ask_name
    puts "Name?"
    print ">"
    gets.chomp.capitalize
  end

  def ask_address
    puts "Address?"
    print ">"
    gets.chomp
  end

end
