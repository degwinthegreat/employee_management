class AddNotnullNameAndEmail < ActiveRecord::Migration[5.2]
  def change
    change_column_null :employees, :name, false, 0
    change_column_null :employees, :email, false, 0
  end
end
