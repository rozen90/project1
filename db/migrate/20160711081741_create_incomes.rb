class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.date :date
      t.integer :price
      t.integer :income_category_id

      t.timestamps null: false
    end
  end
end
