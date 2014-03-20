json.username @profile.user.username
json.extract! @profile, :first_name, :last_name, :email, :phone, :street, :city, :state, :zip, :created_at, :updated_at
json.image_url asset_url(@profile.image_url)
