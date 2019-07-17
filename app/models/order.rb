class Order
  attr_accessor :id
  attr_reader :customer, :meal, :employee

  def initialize(attrs={})
    @id = attrs[:id]
    @customer = attrs[:customer]
    @meal = attrs[:meal]
    @employee = attrs[:employee]
    @delivered = attrs[:delivered] || false
  end

  def csv_array
    [@id, @delivered, @meal.id, @employee.id, @customer.id]
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end

  def name
    "#{order.meal.name} : #{order.meal.price}€ - #{order.employee.username} - #{order.customer.name} - #{order.customer.address}"
  end


end
