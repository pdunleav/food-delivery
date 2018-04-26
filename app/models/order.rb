class Order
  attr_accessor :id
  attr_reader :meal, :customer, :employee, :delivered
  def initialize(attributes = {})
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    @delivered = attributes[:delivered] || false
  end

  def deliver!
    @delivered = true
  end

  def delivered?
    @delivered
  end

  def self.csv_headers
    ['id', 'meal_id', 'customer_id', 'employee_id', 'delivered']
  end
end
