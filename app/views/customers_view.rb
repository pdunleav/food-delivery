class CustomersView

  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end

  def ask_for_name
    puts "name?"
    gets.chomp
  end

  def ask_for_address
    puts "address?"
    gets.chomp
  end
end
