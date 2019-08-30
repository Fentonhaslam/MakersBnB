# frozen_string_literal: true

feature 'Delete a space' do
  scenario 'A user can delete a space' do
    sign_up
    add_space('London flat', '100', '2 bed flat in London')
    first('.space').click_button 'Delete space'
    expect(current_path).to eq '/user/spaces'
    expect(page).not_to have_content 'London flat'
    expect(page).not_to have_content 100
    expect(page).not_to have_content '2 bed flat in London'
  end
end