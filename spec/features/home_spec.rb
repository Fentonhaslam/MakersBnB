feature 'test homepage' do
  scenario 'Can show button to all spaces' do
    visit('/')
    expect(page).to have_button('List of spaces')
  end

  scenario 'Can go to the list of spaces' do
    visit('/')
    click_button('List of spaces')
    expect(page).to have_content('List of spaces')
  end


end

