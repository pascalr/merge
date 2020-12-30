require "application_system_test_case"

class PartialsTest < ApplicationSystemTestCase
  setup do
    @partial = partials(:one)
  end

  test "visiting the index" do
    visit partials_url
    assert_selector "h1", text: "Partials"
  end

  test "creating a Partial" do
    visit partials_url
    click_on "New Partial"

    fill_in "Content", with: @partial.content
    fill_in "Name", with: @partial.name
    click_on "Create Partial"

    assert_text "Partial was successfully created"
    click_on "Back"
  end

  test "updating a Partial" do
    visit partials_url
    click_on "Edit", match: :first

    fill_in "Content", with: @partial.content
    fill_in "Name", with: @partial.name
    click_on "Update Partial"

    assert_text "Partial was successfully updated"
    click_on "Back"
  end

  test "destroying a Partial" do
    visit partials_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Partial was successfully destroyed"
  end
end
