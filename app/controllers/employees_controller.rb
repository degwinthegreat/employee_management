class EmployeesController < ApplicationController
  before_action :identification, only: [:edit, :update]
  before_action :authority_check, only: [:new, :create, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
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

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to root_path, notice: "社員情報を削除しました"
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :profile, :password, :password_confirmation, :admin_flag)
  end

  def identification
    unless Employee.find(params[:id]).id == current_employee.id
      redirect_to root_path, notice: '権限がありません'
    end
  end
  
  def authority_check
    unless current_employee.admin_flag
      redirect_to root_path, notice: '権限がありません'
    end
  end
end
