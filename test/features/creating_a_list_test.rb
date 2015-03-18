require 'test_helper'

feature "Creating lists in the howto app" do
  scenario "A user should be able to create a new list" do
    visit lists_path
    page.must_have_content "New List"
  end

  scenario "Clicking to show a list should reveal the steps" do
    visit list_path(lists(:one))
    click_on 'Show'
    page.must_have_content "Collect underpants"
    page.must_have_content "Profit"
    page.wont_have_content ""
  end
end
