class Expense < ActiveRecord::Base
  belongs_to :expense_category

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
  	  csv << column_names
  	  all.each do |income_category|
  		csv << income_category.attributes.values_at(*column_names)
  	  end
  	end
  end
end
