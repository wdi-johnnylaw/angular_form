json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip
  json.url profile_url(profile, format: :json)
end
