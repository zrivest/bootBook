class User < ActiveRecord::Base
  has_many :friendships, foreign_key: "user_id", class_name: "Friendship"
  has_many :friends, through: :friendships
  has_many :pending_friendships, foreign_key: "user_id", class_name: "PendingFriendship"
  has_many :pending_friends, through: :pending_friendships
  belongs_to :cohort

  has_secure_password
  attr_accessible :first_name, :last_name, :email, :password, :birthdate, :cohort_id, :interest
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :birthdate, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :cohort_id, :presence => true
  validates :interest, :presence => true

  def accept_friend(friend_id)
    request = self.pending_friendships.find_by_pending_friend_id(friend_id)
    request.approve!
  end
end
