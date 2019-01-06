# frozen_string_literal: true

module SessionsHelper
  def current_user
    @current_user ||= Employee.find_by(id: session[:employee_id])
  end

  def logged_in?
    current_user.present?
  end
end
