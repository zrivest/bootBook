require 'spec_helper'

describe Friendship do
  let(:friendship) { Friendship.new }
  
  context "#initialize" do
    user = FactoryGirl.create(:user)
    friend = FactoryGirl.create(:user)
    it "friendship is valid if user_id, friend_id" do
      friendship.user_id = user.id
      friendship.friend_id = friend.id
      expect(friendship).to be_valid
    end

    it "friend is invalid without a user_id" do
      friendship.friend_id = friend.id
      expect(friendship).to_not be_valid
    end

    it "friend is invalid without a friend_id" do
      friendship.user_id = user.id
      expect(friendship).to_not be_valid
    end
    it "friendship user_id can only call a friend_id once" do      
      friendship.user_id = user.id
      friendship.friend_id = friend.id
      doubled_friendship = Friendship.new
      doubled_friendship.user_id = user.id
      doubled_friendship.friend_id = friend.id
    end
  end
end
