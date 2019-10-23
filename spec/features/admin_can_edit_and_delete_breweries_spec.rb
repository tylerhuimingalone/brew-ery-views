require 'rails_helper'

feature "an admin can see all breweries and change their information" do
  scenario "visits /admin/breweries and sees a table of breweries" do
    brewery1 = FactoryBot.create(:brewery)
    brewery2 = FactoryBot.create(:brewery)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/breweries'

    expect(page).to have_content(brewery1.name)
    expect(page).to have_content(brewery2.name)
    expect(page).to have_content("Edit")
    expect(page).to have_content("Delete")
  end

  scenario "can delete a brewery" do
    brewery1 = FactoryBot.create(:brewery)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/breweries'
    expect(page).to have_content(brewery1.name)
    click_link "Delete"

    expect(page).not_to have_content(brewery1.name)
  end

  scenario "can edit a brewery" do
    brewery1 = FactoryBot.create(:brewery)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/breweries'

    expect(page).to have_content(brewery1.name)
    click_link "Edit"

    fill_in 'Name', with: "Test Name"
    click_on "Update Brewery"

    expect(page).not_to have_content(brewery1.name)
    expect(page).to have_content("Test Name")
  end

  scenario "can delete a brewery from the edit page" do
    brewery1 = FactoryBot.create(:brewery)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/breweries'

    expect(page).to have_content(brewery1.name)
    click_link "Edit"

    click_link "Delete"

    expect(page).not_to have_content(brewery1.name)
    expect(page).to have_content("Current Breweries")
  end

  scenario "can't edit a brewery incorrectly" do
    brewery1 = FactoryBot.create(:brewery)
    admin = FactoryBot.create(:user, admin: true)

    login_as admin
    visit '/admin/breweries'

    expect(page).to have_content(brewery1.name)
    click_link "Edit"

    fill_in 'Name', with: ""
    click_on "Update Brewery"

    expect(page).not_to have_content(brewery1.name)
    expect(page).to have_content("can't be blank")
  end

  scenario "a non-admin can't visit the page" do
    expect{visit '/admin/breweries'}.to raise_error(ActionController::RoutingError)
  end
end
