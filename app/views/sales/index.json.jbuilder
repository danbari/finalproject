json.array!(@sales) do |sale|
  json.extract! sale, :id, :saledate, :saleprice
  json.url sale_url(sale, format: :json)
end
