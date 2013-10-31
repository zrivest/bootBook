module UserHelper


  def sign_up_as_user
    visit root_path
    click_link 'Sign up!'
    fill_in "user_first_name", with: "Zach"
    fill_in "user_last_name", with: "Rivest"
    fill_in "user_email", with: "z@j.com"
    fill_in "user_password", with: "test"
    select "Salamanders", from: "user_cohort_id"
    fill_in "user_interest", with: "making sweet friends"
    click_button 'Save User'
  end

end