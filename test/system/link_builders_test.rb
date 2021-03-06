require "application_system_test_case"

class LinkBuildersTest < ApplicationSystemTestCase
  setup do
    @link_builder = link_builders(:one)
  end

  test "visiting the index" do
    visit link_builders_url
    assert_selector "h1", text: "Link Builders"
  end

  test "creating a Link builder" do
    visit link_builders_url
    click_on "New Link Builder"

    fill_in "Commit", with: @link_builder.commit
    fill_in "File", with: @link_builder.file
    click_on "Create Link builder"

    assert_text "Link builder was successfully created"
    click_on "Back"
  end

  test "updating a Link builder" do
    visit link_builders_url
    click_on "Edit", match: :first

    fill_in "Commit", with: @link_builder.commit
    fill_in "File", with: @link_builder.file
    click_on "Update Link builder"

    assert_text "Link builder was successfully updated"
    click_on "Back"
  end

  test "destroying a Link builder" do
    visit link_builders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Link builder was successfully destroyed"
  end
end
