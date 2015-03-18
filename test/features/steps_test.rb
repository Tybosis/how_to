require 'test_helper'

feature "Steps associated with a given list" do
  scenario "clicking show will only show that step" do
    visit list_steps_path(lists(:two))
    all('a').select { |elt| elt.text == "Show" }.first.click
    page.text.must_include "Press the mouse or trackpad button"
    page.text.wont_include "Press command + shift + 4($)"
  end

  scenario "editing a step is possible" do
    visit list_steps_path(lists(:two))
    all('a').select { |elt| elt.text == "Edit" }.first.click
    fill_in('Content', with: 'Parse the XML document')
    click_on 'Update Step'
    page.text.must_include 'Parse the XML document'
    page.text.wont_include 'Press the mouse or trackpad button'
  end

  scenario "deleting a step is possible" do
    visit list_steps_path(lists(:two))
    all('a').select { |elt| elt.text == "Destroy" }.first.click
    page.text.wont_include 'Press the mouse or trackpad button'
    page.text.must_include 'Step was successfully destroyed.'
  end

  scenario "adding a new step is possible" do
    visit list_steps_path(lists(:two))
    click_on 'New Step'
    fill_in('Content', with: 'Smile!')
    click_on 'Create Step'
    page.text.must_include 'Smile!'
    page.text.must_include 'Step was successfully created.'
  end
end
