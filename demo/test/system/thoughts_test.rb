require "application_system_test_case"

class ThoughtsTest < ApplicationSystemTestCase
  setup do
    @thought = thoughts(:one)
  end

  test "visiting the index" do
    visit thoughts_url
    assert_selector "h1", text: "Thoughts"
  end

  test "creating a Thought" do
    visit thoughts_url
    click_on "New Thought"

    fill_in "Body", with: @thought.body
    fill_in "Title", with: @thought.title
    fill_in "User", with: @thought.user_id
    click_on "Create Thought"

    assert_text "Thought was successfully created"
    click_on "Back"
  end

  test "updating a Thought" do
    visit thoughts_url
    click_on "Edit", match: :first

    fill_in "Body", with: @thought.body
    fill_in "Title", with: @thought.title
    fill_in "User", with: @thought.user_id
    click_on "Update Thought"

    assert_text "Thought was successfully updated"
    click_on "Back"
  end

  test "destroying a Thought" do
    visit thoughts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Thought was successfully destroyed"
  end
end
