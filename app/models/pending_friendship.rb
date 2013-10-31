class PendingFriendship < ActiveRecord::Base

  belongs_to :user, foreign_key: "user_id"
  belongs_to :pending_friend, class_name: "User", foreign_key: "pending_friend_id"

  validates :user_id, presence: true
  validates :pending_friend_id, presence: true
  validates_uniqueness_of :pending_friend_id, scope: :user_id
  
  def approve!
    friendship = Friendship.new
    friendship.user_id = self.user_id
    friendship.friend_id = self.pending_friend_id
    friendship.save!
    friendship = Friendship.new
    friendship.user_id = self.pending_friend_id
    friendship.friend_id = self.user_id
    friendship.save!
    self.destroy
  end
  
end
