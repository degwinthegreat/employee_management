# frozen_string_literal: true

class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def new
    authorize!
    @employee = Employee.new
  end

  def create
    authorize!
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_path(@employee.id)
    else
      render 'new'
    end
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    authorize!

    if @employee.update(employee_params)
      redirect_to employee_path(@employee.id), notice: "社員情報を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    authorize!

    @employee.destroy
    redirect_to root_path, notice: '社員情報を削除しました'
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :profile, :password, :password_confirmation, :admin, members_attributes: [:name])
  end
end
