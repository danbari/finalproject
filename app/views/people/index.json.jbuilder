json.array!(@people) do |person|
  json.extract! person, :id, :firstname, :lastname, :username, :password, :street, :city, :state, :zip, :email, :phone
  json.url person_url(person, format: :json)
end
