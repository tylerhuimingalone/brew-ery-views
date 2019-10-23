require "rails_helper"

feature "user avatar" do
  scenario "user signs up and uploads a profile photo" do
    visit new_user_registration_path
    click_link "Sign Up"

    fill_in 'Username:', with: 'john'
    fill_in 'Email:', with: 'john@example.com'
    fill_in 'Password:', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    attach_file 'Upload Profile Picture', "#{Rails.root}/spec/support/images/brewery-views-test-pic.jpeg"
    click_button "Sign up"

    expect(page).to have_css("img[src*='brewery-views-test-pic.jpeg']")
  end
end
