# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.text :profile
      t.string :password_digest
      t.boolean :admin_flag, default: false, null: false

      t.timestamps
    end
  end
end
