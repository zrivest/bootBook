module UsersHelper
  def requested_friends
    @pending_friendships = PendingFriendship.where(pending_friend_id: current_user.id)
    @users = []
    @pending_friendships.each do |pending_friendship|
      @users << User.find(pending_friendship.user_id)
    end
    @users
  end

  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.first_name, class: "gravatar")
  end
end
