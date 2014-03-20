class User < ActiveRecord::Base
  has_one :profile
  has_many :outgoing_friendships, foreign_key: :requester_id, class_name: 'Friendship'
  has_many :incoming_friendships, foreign_key: :requested_id, class_name: 'Friendship'

  has_many :outgoing_friends, through: :outgoing_friendships, source: :requested
  has_many :incoming_friends, through: :incoming_friendships, source: :requester

  def friends
    incoming_friends.includes(:profile) & outgoing_friends.includes(:profile)
  end

  def requestees
    outgoing_friends - friends
  end

  def requesters
    incoming_friends - friends
  end
end
