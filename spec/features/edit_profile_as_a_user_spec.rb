require 'spec_helper'

describe "editing a user profile as a user" do
  let(:user_data) { {first_name: "Zach", last_name: "Rivest", email: "zrivest@gmail.com", password: "123", interest: "making sweet friends"} }
  let(:cohort) { FactoryGirl.create(:cohort, cohort_name: "Ocelots") }
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    login_in_as_user(user)
    visit edit_user_path(user.id)
  end

  it "should successfully edit a user and display user show page" do
    expect(page).to have_button("Update User")
  end    

  it "should render the edit page with the first name error" do
    fill_in :user_first_name, with: ""
    click_button "Update User"
    # page.should have_text("First name can't be blank")
    expect(page).to have_text("First name can't be blank")
  end

  it "should render the edit page with the last name error" do
    fill_in :user_last_name, with: ""
    click_button "Update User"
    # page.should have_text("Last name can't be blank")
    expect(page).to have_text("Last name can't be blank")
  end

  it "should render the edit page with the interest error" do
    fill_in :user_interest, with: ""
    click_button "Update User"
    expect(page).to have_text("Interest can't be blank")
  end
end
