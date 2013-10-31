require 'spec_helper'

describe "signing up a user" do

  it "should successfully signup a user and display user show page" do
    FactoryGirl.create(:cohort, cohort_name: "Salamanders")
    sign_up_as_user
    page.should have_text("hey there, Zach")
  end
end