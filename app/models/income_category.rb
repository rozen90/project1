class IncomeCategory < ActiveRecord::Base
	belongs_to :user
	has_many :incomes
end
