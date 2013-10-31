class Friendship < ActiveRecord::Base
  belongs_to :user, foreign_key: "user_id"
  belongs_to :friend, class_name: "User", foreign_key: "friend_id"

  validates :user_id, presence: true
  validates :friend_id, presence: true
end

