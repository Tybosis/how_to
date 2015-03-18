require 'test_helper'

feature "Creating lists in the howto app" do
  scenario "A user should be able to create a new list" do
    visit lists_path
    click_on 'New List'
    fill_in('Name', with: "How to eat a banana")
    fill_in('Description', with: "Follow these steps and you too can enjoy!")
    click_on 'Create List'
    page.text.must_include 'How to eat a banana'
    page.text.must_include 'Follow these steps and you too can enjoy!'
  end

  scenario "Clicking to show a list should reveal the steps" do
    visit lists_path
    all('a').select { |elt| elt.text == "Show Steps" }.first.click
    page.must_have_content "Press command + shift + 4($)"
    page.wont_have_content "Collect underpants"
  end

  scenario "editing a list should succeed" do
    visit edit_list_path(lists(:one))
    fill_in('Name', with: 'This is the new title!!!')
    click_on 'Update List'
    page.text.must_include 'This is the new title!!!'
    page.text.must_include 'List was successfully updated'
  end

  scenario "deleting a list is possible" do
    visit lists_path
    all('a').select { |elt| elt.text == "Destroy" }.first.click
    page.text.must_include 'successfully'
    page.text.wont_include 'Take a screenshot'
  end
end
