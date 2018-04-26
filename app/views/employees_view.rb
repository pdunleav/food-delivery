class EmployeesView
  def display_employees(employees)
    employees.each do |employees|
      puts "#{employees.id} - #{employees.username} - #{employees.role}"
    end
  end
end
