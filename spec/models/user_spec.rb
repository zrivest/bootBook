require "spec_helper"

describe User do
  let(:new_user) { User.new(first_name: "Joe", last_name: "Smchmoe", email: "joe@example.com", password: "123", birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing") }
  
  context "#initialize" do 
    it "User is valid if first name, last name, email, birthdate, and password are provided" do
      new_user.save!
      expect(new_user).to be_valid    
    end

    it "User is invalid if first name is nil" do
      expect(User.new(first_name: nil, last_name: "Smchoe", email: "joe@example.com", password: "123", birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if last name is nil" do
      expect(User.new(last_name: nil, first_name: "Joe", email: "joe@example.com", password: "123", birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if password is nil" do
      expect(User.new(first_name: "Joe", last_name: "Smchmoe", email: "joe@example.com", password: nil, birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if email is nil" do
      expect(User.new(first_name: "Joe", last_name: "Smchmoe", email: nil, password: "123", birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if cohort ID is nil" do
      expect(User.new(first_name: "Joe", last_name: "Smchmoe", email: "joe@example.com", password: "123", birthdate: "1990-01-01", interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if birthdate is nil" do
      expect(User.new(first_name: "Joe", last_name: "Smchmoe", email: "joe@example.com", password: "123", birthdate: nil, cohort_id: 1, interest: "Skiing")).to_not be_valid
    end

    it "User is invalid if interest is nil" do
      expect(User.new(first_name: "Joe", last_name: "Smchmoe", email: "joe@example.com", password: "123", birthdate: "1990-01-01", cohort_id: 1, interest: nil)).to_not be_valid
    end
    
    it "User is invalid if email is not unique" do
      new_user.save!
      expect(User.create(first_name: "John", last_name: "Smith", password: "password", email: "joe@example.com", birthdate: "1990-01-01", cohort_id: 1, interest: "Skiing")).to_not be_valid
    end
  end
end
