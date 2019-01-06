# frozen_string_literal: true

class EmployeesLoyalty < ApplicationLoyalty
  def admin?
    user.admin?
  end

  def create?
    user.admin?
  end

  def edit?
    user.id == record.id
  end

  def update?
    edit?
  end

  def destroy?
    user.admin?
  end
end
