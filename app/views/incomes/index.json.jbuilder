json.array!(@incomes) do |income|
  json.extract! income, :id, :date, :price, :income_category_id
  json.url income_url(income, format: :json)
end
