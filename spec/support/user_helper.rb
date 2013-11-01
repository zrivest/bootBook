module UserHelper

  def sign_up_as_user(data)
    visit root_path
    click_link 'Sign up!'
    fill_in "user_first_name", with: data[:first_name]
    fill_in "user_last_name", with: data[:last_name]
    fill_in "user_email", with: data[:email]
    fill_in "user_password", with: data[:password]
    select "Ocelots", from: "user_cohort_id"
    fill_in "user_interest", with: data[:interest]
    click_button 'Save User'
  end

  def sign_up_as_user_without_cohort(data)
    visit root_path
    click_link 'Sign up!'
    fill_in "user_first_name", with: data[:first_name]
    fill_in "user_last_name", with: data[:last_name]
    fill_in "user_email", with: data[:email]
    fill_in "user_password", with: data[:password]
    fill_in "user_interest", with: data[:interest]
    click_button 'Save User'
  end

  def login_in_as_user(user)
    visit root_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"
  end
end