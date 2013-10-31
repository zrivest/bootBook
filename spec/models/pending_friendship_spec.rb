require 'spec_helper'

describe PendingFriendship do
  let(:pending_friendship) { PendingFriendship.new }
  
  context "#initialize" do
    user = FactoryGirl.create(:user)
    friend = FactoryGirl.create(:user)
    it "pending_friendship is valid if user_id, pending_friend_id" do
      pending_friendship.user_id = user.id
      pending_friendship.pending_friend_id = friend.id
      expect(pending_friendship).to be_valid
    end

    it "pending_friendship is invalid without a user_id" do
      pending_friendship.pending_friend_id = friend.id
      expect(pending_friendship).to_not be_valid
    end

    it "pending_friendship is invalid without a pending_friend_id" do
      pending_friendship.user_id = user.id
      expect(pending_friendship).to_not be_valid
    end

    it "pending_friendship user_id can only call a pending_friend_id once" do      
      pending_friendship.user_id = user.id
      pending_friendship.pending_friend_id = friend.id
      doubled_friendship = PendingFriendship.new
      doubled_friendship.user_id = user.id
      doubled_friendship.pending_friend_id = friend.id
    end
  end
end
