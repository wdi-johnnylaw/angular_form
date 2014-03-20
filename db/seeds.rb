# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  { username: 'johnnylaw', first_name: 'John', last_name: 'Lawrence', email: 'johnonrails@gmail.com', phone: '+18057222818' },
  { username: 'jimbob', first_name: 'Jim', last_name: 'Bob', email: 'jimbob@example.com', phone: '+13105551212' },
  { username: 'julio', first_name: 'Julio', last_name: 'DownByTheSchoolYard', email: 'julio@example.com', phone: '+13105551212' },
  { username: 'bilbo', first_name: 'Bilbo', last_name: 'Baggins', email: 'bilbo@example.com', phone: '+13105551212' },
  { username: 'marco', first_name: 'Marco', last_name: 'Polo', email: 'marcopolo@example.com', phone: '+13105551212' },
  { username: 'philipe', first_name: 'Philipe', last_name: 'Navarro', email: 'philipe@example.com', phone: '+13105551212' },
  { username: 'saltydog', first_name: 'George', last_name: 'Monsoon', email: 'george@example.com', phone: '+13105551212' },
  { username: 'blahblah', first_name: 'Blah', last_name: 'Blah', email: 'blahblah@example.com', phone: '+13105551212' }
].map do |user_attrs|
  username = user_attrs.delete(:username)
  user = User.find_by(username: username) || User.create(username: username)
  profile = user.profile || user.create_profile(
    user_attrs.merge street: '108 Brooks Ave', city: 'Venice', state: 'CA', zip: '90291', image_url: "#{user.username}.jpg"
  )
  user
end

Friendship.delete_all

users.count.times do |i|
  (i+1..users.count).each do |j|
    case rand(6)
    when 0, 1, 2
      Friendship.create requester: users[i], requested: users[j]
      Friendship.create requested: users[i], requester: users[j]
    when 3
      Friendship.create requester: users[i], requested: users[j]
    when 4
      Friendship.create requested: users[i], requester: users[j]
    end
  end
end
