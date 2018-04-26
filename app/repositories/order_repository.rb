require 'csv'
require_relative "../models/order"

class OrderRepository
  def initialize(csv_file, meal_repository, customer_repository, employee_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @csv_file = csv_file
    @orders = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def add(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def find(id)
    @orders.find { |order| order.id == id }
  end

  def mark_as_delivered(order)
    order.deliver!
    save_csv
  end

  def all_undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def delivery_guy_undelivered(delivery_guy)
    all_undelivered_orders.select { |order| order.employee == delivery_guy }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      id = row[:id].to_i
      meal = @meal_repository.find(row[:meal_id].to_i)
      customer = @customer_repository.find(row[:customer_id].to_i)
      employee = @employee_repository.find(row[:employee_id].to_i)
      delivered = row[:delivered] == "true"
      @orders << Order.new(id: id, meal: meal, customer: customer, employee: employee, delivered: delivered)
    end
    @next_id = @orders.last ? @orders.last.id + 1 : 1
  end

  def save_csv
    CSV.open(@csv_file, "wb") do |csv|
      csv << @orders.first.class.csv_headers
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id, order.employee.id, order.delivered?]
      end
    end
  end
end
