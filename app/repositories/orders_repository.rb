require "csv"
require_relative "../models/order.rb"
require_relative "base_repository"

class OrdersRepository < BaseRepository
  def initialize(csv_path, meals_repository, employees_repository, customers_repository)
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    super(csv_path)
  end

  def build_element(row)
    id = row[:id].to_i
    delivered = (row[:delivered] == "true")
    meal_id = row[:meal_id].to_i
    employee_id = row[:employee_id].to_i
    customer_id = row[:customer_id].to_i
    meal = @meals_repository.find(meal_id)
    employee = @employees_repository.find(employee_id)
    customer = @customers_repository.find(customer_id)
    Order.new(id: id, delivered: delivered, meal: meal, employee: employee, customer: customer)
  end

  def csv_headers
    ['id','delivered', 'meal_id', 'employee_id', 'customer_id']
  end

  def undelivered_orders
    @elements.reject { |element| element.delivered? }
  end
end
