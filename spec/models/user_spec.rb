require "spec_helper"

describe User do
  
  context "#initialize" do 
    it "User is valid if first name, last name, email, birthdate, and password are provided" do
      user = FactoryGirl.build(:user)
      user.save!
      expect(user).to be_valid
    end

    it "User is invalid if first name is nil" do
      user = FactoryGirl.build(:user, first_name: nil)
      expect(user).to_not be_valid
    end

    it "User is invalid if last name is nil" do
      user = FactoryGirl.build(:user, last_name: nil)
      expect(user).to_not be_valid
    end

    it "User is invalid if password is nil" do
      user = FactoryGirl.build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "User is invalid if email is nil" do
      user = FactoryGirl.build(:user, email: nil )
      expect(user).to_not be_valid
    end

    it "User is invalid if cohort ID is nil" do
      user = FactoryGirl.build(:user, cohort_id: nil)
      expect(user).to_not be_valid
    end

    it "User is invalid if birthdate is nil" do
      user = FactoryGirl.build(:user, birthdate: nil)
      expect(user).to_not be_valid
    end

    it "User is invalid if interest is nil" do
      user = FactoryGirl.build(:user, interest: nil)
      expect(user).to_not be_valid
    end
    
    it "User is invalid if email is not unique" do
      email = Faker::Internet.email
      FactoryGirl.build(:user, email: email).save!
      expect(FactoryGirl.build(:user, email: email)).to_not be_valid
    end
  end
  context "#associations" do
    it "User has a cohort" do
      user = FactoryGirl.create(:user)
      # cohort = Cohort.first
      cohort = FactoryGirl.create(:cohort)
      cohort.students << user
      expect(user.cohort).to eq(cohort)
    end
    it "User has requested friends" do
      user = FactoryGirl.create(:user)
      friend = FactoryGirl.create(:user)
      user.pending_friends << friend
      expect(user.pending_friends.include?(friend)).to be_true
    end
    it "User can .accept_friend, friend is added to friends list" do
      user = FactoryGirl.create(:user)
      friend = FactoryGirl.create(:user)
      user.pending_friends << friend
      user.accept_friend(friend.id)
      expect(user.friends.include?(friend)).to be_true
    end
  end
end


