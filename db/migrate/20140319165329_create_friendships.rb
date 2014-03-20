class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :requester, index: true
      t.references :requested, index: true
      t.datetime :accepted_at

      t.timestamps
    end
  end
end
