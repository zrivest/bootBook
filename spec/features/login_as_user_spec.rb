require 'spec_helper'

describe "login from root path" do
  let(:user_data) { FactoryGirl.create(:user) }

  it "should display an error if the password or username is incorrect" do
    user_data.password = "456"
    login_in_as_user(user_data)
    page.should have_text("We were unable to find that email and password combination.")
  end

  it "should display the users profile page" do
    FactoryGirl.create(:cohort)
    login_in_as_user(user_data)
    page.should have_text("Hey there, #{user_data.first_name}!")
  end

end
