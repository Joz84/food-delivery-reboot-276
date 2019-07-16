require_relative "app/repositories/meals_repository.rb"
require_relative "app/controllers/meals_controller.rb"
require_relative "app/repositories/customers_repository.rb"
require_relative "app/controllers/customers_controller.rb"

meals_repository = MealsRepository.new("data/meals.csv")
meals_controller = MealsController.new(meals_repository)

meals_controller.list
meals_controller.create

customers_repository = CustomersRepository.new("data/customers.csv")
customers_controller = CustomersController.new(customers_repository)

customers_controller.list
customers_controller.create
