module SessionsHelper
  def current_employee
    @current_employee ||= Employee.find_by(id: session[:employee_id])
  end

  def logged_in?
    current_employee.present?
  end
end
