require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(orders_repository, meals_repository, employees_repository, customers_repository)
    @view = OrdersView.new
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    @orders_repository = orders_repository
  end

  def list_undelivered
    undelivered_orders = @orders_repository.undelivered_orders
    @view.display_list(undelivered_orders)
  end

  def create
    # Demander au repo la liste des meals
    # Demander à la vue de lister les meals
    # Demander à la vue de deamnder au user l'index du meal selectionné et le stocker dans une variable
    # Récupérer l'instance dans le tableau grace à l'index
    meals = @meals_repository.all
    @view.display_list(meals)
    meal_index = @view.ask_index
    meal = meals[meal_index]

    delivery_guys = @employees_repository.delivery_guys
    @view.display_list(delivery_guys)
    delivery_guy_index = @view.ask_index
    delivery_guy = delivery_guys[delivery_guy_index]

    customers = @customers_repository.all
    @view.display_list(customers)
    customer_index = @view.ask_index
    customer = customers[customer_index]

    order = Order.new(meal: meal, employee: delivery_guy, customer: customer)
    @orders_repository.add(order)
  end
end
