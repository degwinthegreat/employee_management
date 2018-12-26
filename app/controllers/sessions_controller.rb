class SessionsController < ApplicationController
  def new
  end

  def create
    employee = Employee.find_by(email: params[:session][:email].downcase)
    if employee && employee.authenticate(params[:session][:password])
      session[:employee_id] = employee.id
      redirect_to employee_path(employee.id)
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render 'new'
    end
  end

  def destroy
    session.delete(:employee_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
