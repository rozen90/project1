class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.integer :price
      t.integer :expense_category_id

      t.timestamps null: false
    end
  end
end
