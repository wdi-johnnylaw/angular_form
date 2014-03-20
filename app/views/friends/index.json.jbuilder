json.array! @friends do |friend|
  json.extract! friend, :username
  json.extract! friend.profile, :first_name, :last_name
  json.url profile_url(friend.profile)
  json.image_url asset_url(friend.profile.image_url)
end