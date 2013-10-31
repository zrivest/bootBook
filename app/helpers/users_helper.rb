module UsersHelper
  def requested_friends
    @pending_friendships = PendingFriendship.where(pending_friend_id: current_user.id)
    @users = []
    @pending_friendships.each do |pending_friendship|
      @users << User.find(pending_friendship.user_id)
    end
    @users
  end
end
