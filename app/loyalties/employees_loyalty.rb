# frozen_string_literal: true

class EmployeesLoyalty < ApplicationLoyalty
  def admin?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user == @employee
  end

  def destroy?
    user.admin?
  end
end
