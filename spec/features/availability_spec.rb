feature "adding a new space" do
  scenario "user can add a new space" do
    visit('/')
    click_button('List of spaces')
    add_space("London flat", 100, "2 bed flat in London")
    expect(page).to have_content 'London flat'
    expect(page).to have_content '100'
    expect(page).to have_content '2 bed flat in London'

    first('.space').click_button 'Request Booking'
    fill_in('request', with: 'I would like to book this space please')
    click_button('Submit')

    expect(page).to have_content 'Pending'
  end
end
