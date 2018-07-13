require "application_system_test_case"

class ProspectsTest < ApplicationSystemTestCase
  setup do
    @prospect = prospects(:one)
  end

  test "visiting the index" do
    visit prospects_url
    assert_selector "h1", text: "Prospects"
  end

  test "creating a Prospect" do
    visit prospects_url
    click_on "New Prospect"

    fill_in "Email", with: @prospect.email
    fill_in "Location", with: @prospect.location
    fill_in "Name", with: @prospect.name
    fill_in "Pax", with: @prospect.pax
    fill_in "Phone", with: @prospect.phone
    fill_in "Prospect Date", with: @prospect.prospect_date
    fill_in "Type", with: @prospect.type
    click_on "Create Prospect"

    assert_text "Prospect was successfully created"
    click_on "Back"
  end

  test "updating a Prospect" do
    visit prospects_url
    click_on "Edit", match: :first

    fill_in "Email", with: @prospect.email
    fill_in "Location", with: @prospect.location
    fill_in "Name", with: @prospect.name
    fill_in "Pax", with: @prospect.pax
    fill_in "Phone", with: @prospect.phone
    fill_in "Prospect Date", with: @prospect.prospect_date
    fill_in "Type", with: @prospect.type
    click_on "Update Prospect"

    assert_text "Prospect was successfully updated"
    click_on "Back"
  end

  test "destroying a Prospect" do
    visit prospects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prospect was successfully destroyed"
  end
end
