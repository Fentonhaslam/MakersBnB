feature 'MakerBnb' do
  feature 'Homepage' do
    scenario 'Can show button to all spaces' do
      visit('/')
      expect(page).to have_button('List of spaces')
    end

    scenario 'A user can see a list of spaces' do
      visit('/')
      click_button('List of spaces')
      expect(page).to have_content "London flat"
      expect(page).to have_content "Surrey mansion"
      expect(page).to have_content "Sussex cottage"
      expect(page).to have_button('Add space')
    end
  end
  feature 'Spaces' do
    scenario 'can create a new spaces' do
      visit('/spaces')
      click_button('Add space')
      expect(page).to have_button('Create space')
    end
  end
end


