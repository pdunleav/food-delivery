require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def list
    customers = @customer_repository.all
    @view.display_customers(customers)
  end

  def add
    name = @view.ask_for_name
    address = @view.ask_for_address
    customer = Customer.new(name: name, address: address)
    @customer_repository.add(customer)
  end
end
