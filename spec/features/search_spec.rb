require 'rails_helper'

feature 'item', type: :feature do
  describe 'Get#search' do
    it 'searchをするとsearch_itemsページへ遷移すること' do
      fill_in 'input', with: 'aaa'
      click_button "search"
      expect(page).to have_content('aaa')
    end
  end
end