require_relative "app/repositories/employee_repository"

csv_file = "data/employees.csv"
repo = EmployeeRepository.new(csv_file)

p repo
