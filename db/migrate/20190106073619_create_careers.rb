class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string :company_name, null: false
      t.date :join_date, null: false
      t.date :turnover_date
      t.references :employee, foreign_key: true
      t.timestamps
    end
  end
end
