class Profile < ActiveRecord::Base
  belongs_to :user

  def to_param
    user.username
  end
end
