class RenameAdminFlagToAdmin < ActiveRecord::Migration[5.2]
  def change
    rename_column :employees, :admin_flag, :admin
  end
end
