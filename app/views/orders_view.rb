class OrdersView
  def ask_for_id
    puts "which number?"
    gets.chomp.to_i
  end

  def display_orders(orders)
    orders.each do |order|
      puts "#{order.id} - #{order.meal.name} - #{order.customer.name} --- #{order.employee.username}"
    end
  end
end
