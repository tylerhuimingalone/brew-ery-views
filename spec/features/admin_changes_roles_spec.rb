require 'rails_helper'

feature "an admin can see all users and change their roles" do
  scenario "visits /admin/users and sees a table of users" do
    member = FactoryBot.create(:user)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/users'

    expect(page).to have_content(member.email)
    expect(page).to have_content(admin.username)
    expect(page).to have_content("Change Role")
    expect(page).to have_content("Member")
    expect(page).to have_content("Admin")
  end

  scenario "admin changes role of user" do
    member = FactoryBot.create(:user)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/users'
    click_link "Change Role"

    expect(page).to have_content(member.email)
    expect(page).to have_content(admin.username)
    expect(page).to have_content("Change Role")
    expect(page).not_to have_content("Member")
    expect(page).to have_content("Admin")
  end

  scenario "a non-admin can't visit the page" do
    expect{visit '/admin/users'}.to raise_error(ActionController::RoutingError)
  end
end
