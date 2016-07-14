class Income < ActiveRecord::Base
  belongs_to :income_category

  validates :price, numericality: {greater_than: 0}
	
  def self.to_csv(options = {})
  	CSV.generate(options) do |csv|
  		csv << column_names
  		all.each do |income_category|
  			csv << income_category.attributes.values_at(*column_names)
  		end
  	end
  end
end
