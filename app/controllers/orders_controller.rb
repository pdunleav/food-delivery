require_relative "../models/order"
require_relative "../views/meals_view"
require_relative "../views/orders_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @meals_view = MealsView.new
    @orders_view = OrdersView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
  end

  def add
    meals = @meal_repository.all
    @meals_view.display_meals(meals)
    meal_id = @orders_view.ask_for_id
    meal = @meal_repository.find(meal_id)

    customers = @customer_repository.all
    @customers_view.display_customers(customers)
    customer_id = @orders_view.ask_for_id
    customer = @customer_repository.find(customer_id)

    employees = @employee_repository.all
    @employees_view.display_employees(employees)
    employee_id = @orders_view.ask_for_id
    employee = @employee_repository.find(employee_id)

    new_order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.add(new_order)
  end

  def list_all_undelivered
    undelivered_orders = @order_repository.all_undelivered_orders
    @orders_view.display_orders(undelivered_orders)
  end

  def list_employee_undelivered(employee)
    orders = @order_repository.delivery_guy_undelivered(employee)
    @orders_view.display_orders(orders)
  end

  def mark_as_delivered(employee)
    list_employee_undelivered(employee)
    id = @orders_view.ask_for_id
    order = @order_repository.find(id)
    @order_repository.mark_as_delivered(order)
  end
end
