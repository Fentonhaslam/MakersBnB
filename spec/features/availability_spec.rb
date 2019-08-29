# frozen_string_literal: true

feature 'adding a new space' do
  scenario 'client has booked a space' do
    visit('/')
    click_button('List of spaces')
    add_space('London flat', '100', '2 bed flat in London')
    expect(page).to have_content 'London flat'
    expect(page).to have_content '100'
    expect(page).to have_content '2 bed flat in London'
    first('.space').click_button 'Available'

    fill_in('request', with: 'I would like to book this space please')
    click_button('Submit')

    expect(page).to have_content 'London flat'
    expect(page).to have_content '100'
    expect(page).to have_content '2 bed flat in London'
    expect(page).to have_content 'Booked'
  end
end
