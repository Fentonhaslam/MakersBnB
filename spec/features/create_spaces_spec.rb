# frozen_string_literal: true

feature 'adding a new space' do
  scenario 'user can add a new space' do
    sign_up
    click_button('Add space')
    fill_in('title', with: 'London flat')
    fill_in('price', with: 100)
    fill_in('description', with: '2 bed flat in London')
    click_button('Create space')
    expect(page).to have_content 'London flat'
    expect(page).to have_content 100
    expect(page).to have_content '2 bed flat in London'
  end
end
