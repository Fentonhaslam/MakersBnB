# frozen_string_literal: true

feature 'adding a new space' do
  scenario 'user can add a new space' do
    visit('/')
    click_button('List of spaces')
    click_button('Add space')
    fill_in('title', with: 'Brighton Flat')
    fill_in('price', with: '123')
    fill_in('description', with: 'A Brighton Flat by the seaside')
    click_button('Create space')
    expect(page).to have_content 'Brighton Flat'
    expect(page).to have_content '123'
    expect(page).to have_content 'A Brighton Flat by the seaside'
  end
end
