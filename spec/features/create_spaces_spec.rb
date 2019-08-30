# frozen_string_literal: true

feature "adding a new space" do
  scenario "user can add a new space" do
    sign_up
    click_button("Add space")
    fill_in("title", with: "Brighton Flat")
    fill_in("price", with: "123")
    fill_in("description", with: "A Brighton Flat by the seaside")
    click_button("Create space")
    expect(page).to have_content "Brighton Flat"
    expect(page).to have_content "123"
    expect(page).to have_content "A Brighton Flat by the seaside"
  end

  scenario 'a registered user can add a space and their email is listed' do
    visit "/user/new"
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "PASSword123")
    fill_in(:repeat_password, with: "PASSword123")
    click_button("Sign up")

    add_space("London flat", 100, "2 bed flat in London")

    expect(page).to have_content 'test@example.com'
  end
end
