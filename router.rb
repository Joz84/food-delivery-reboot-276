class Router
  def initialize(meals_controller, customers_controller, employees_repository)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @employees_repository = employees_repository
    @running = true
  end

  def manager_choices
    puts "Your Choice?"
    puts "1 - You can add a meal"
    puts "2 - You can view all the meals"
    puts "3 - You can add a customer"
    puts "4 - You can view all the customers"
    puts "5 - You can view all the undelivered orders"
    puts "6 - You can add an order for a customer and assign it to a delivery guy"
    puts "0 - Stop"
  end

  def delivery_guy_choices
    puts "Your Choice?"
    puts "1 - You can view my undelivered orders"
    puts "2 - You can mark an order as delivered"
    puts "0 - Stop"
  end

  def manager_actions(action)
    case action
    when 1 then @meals_controller.create
    when 2 then @meals_controller.list
    when 3 then @customers_controller.create
    when 4 then @customers_controller.list
    # when 5 then @orders_controller.list_undelivered
    # when 6 then @orders_controller.create
    when 0 then @running = false
    end
  end

  def delivery_guy_actions(action)
    case action
    # when 1 then @orders_controller.list_my_undelivered
    # when 2 then @orders_controller.mark_as_delivered
    when 0 then @running = false
    end
  end


  def login
    puts "Username?"
    username = gets.chomp.downcase
    puts "Password?"
    password = gets.chomp
    # Demander au repo de retrouver l'employee à partir de son username
    current_user = @employees_repository.find_by_username(username)
    if current_user && current_user.password == password
      return current_user
    else
      puts "Wrong credentials, Try again..."
      login
    end
  end

  def run
    puts "==============="
    puts "=== Welcome ==="
    puts "==============="


    current_user = login

    while @running
      if current_user.manager?
        manager_choices
        action = gets.chomp.to_i
        manager_actions(action)
      else
        delivery_guy_choices
        action = gets.chomp.to_i
        delivery_guy_actions(action)
      end
    end
  end
end
