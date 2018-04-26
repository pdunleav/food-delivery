require_relative "../views/sessions_view"

class SessionsController

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def login
    username = @view.ask_for(:username)
    password = @view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      # Success!
      return employee
    else
      @view.try_again
      login # Recursive
    end
  end
end
