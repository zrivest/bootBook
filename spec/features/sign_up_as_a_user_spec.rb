require 'spec_helper'

describe "signing up a user" do
  let(:user_data) { {first_name: "Zach", last_name: "Rivest", email: "zrivest@gmail.com", password: "123", interest: "making sweet friends"} }


  it "should successfully signup a user and display user show page" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    sign_up_as_user(user_data)
    page.should have_text("Hey there, Zach!")
  end

  it "should render the signup page with the first name error" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    user_data[:first_name] = ""
    sign_up_as_user(user_data)
    page.should have_text("First name can't be blank")
  end

  it "should render the signup page with the last name error" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    user_data[:last_name] = ""
    sign_up_as_user(user_data)
    page.should have_text("Last name can't be blank")
  end

  it "should render the signup page with the password error" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    user_data[:password] = ""
    sign_up_as_user(user_data)
    page.should have_text("Password digest can't be blank")
  end

  it "should render the signup page with the email error" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    user_data[:email] = ""
    sign_up_as_user(user_data)
    page.should have_text("Email can't be blank")
  end

  it "should render the sign up page with the cohort error" do
    sign_up_as_user_without_cohort(user_data)
    page.should have_text("Cohort can't be blank")
  end

  it "should render the signup page with the interest error" do
    FactoryGirl.create(:cohort, cohort_name: "Ocelots")
    user_data[:interest] = ""
    sign_up_as_user(user_data)
    page.should have_text("Interest can't be blank")
  end

end
