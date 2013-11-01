require 'spec_helper'

describe Item do
  # let(:item) { FactoryGirl.create(:status_item) }
  context '#initialize' do
    it 'Item is invalid without a user_id (owner)' do
      item = FactoryGirl.build(:item, :status, user_id: nil)
      expect(item).to_not be_valid
    end

    it 'Item is invalid without an item_type' do
      item = FactoryGirl.build(:item, :status, item_type: nil)
      expect(item).to_not be_valid
    end

    it 'Item must have a valid item type' do
      item = FactoryGirl.build(:item, :comment, item_type: "otherthing")
      expect(item).to_not be_valid
    end

    it 'Status Item is valid if it contains type, content, an author, and the id of the wall\'s owner' do
      status = FactoryGirl.build(:item, :status)
      expect(status).to be_valid
    end

    it 'Comment Item is valid containing type, content, user_id (owner) and relation_id (status)' do
      comment = FactoryGirl.build(:item, :comment)
      expect(comment).to be_valid
    end

  end

  context '#associations' do

    let(:status) { FactoryGirl.build(:item, :status) }
    let(:comment) { FactoryGirl.build(:item, :comment) }

    it 'Item has an owner' do
      FactoryGirl.build(:user, id: status.user_id)
      FactoryGirl.build(:user, id: comment.user_id)
      expect(status.owner).to eq(User.find(status.user_id))
      expect(comment.owner).to eq(User.find(comment.user_id))
    end

    it 'Status Item has a wall owner' do
      user = FactoryGirl.create(:user)
      user.items << status
      wall_owner = User.find(status.wall_owner_id)
      expect(status.wall_owner).to eq(wall_owner)
    end

    it 'Status Item has many comments' do
      status.comments << FactoryGirl.build(:item, :comment)
      expect(status.comments.empty?).to_not be_true
    end

    it 'Comment Item has no comments' do
      comment.comments << status
      comment.save
      expect(comment.comments).to eq([])
    end

    it 'Comment Item has a parent status' do
      comment.parent = status
      expect(comment.parent).to eq(status)
    end

    it 'Status Item has no parent' do
      status.parent = comment
      status.save
      expect(status.parent).to eq(nil)
    end
  end

end