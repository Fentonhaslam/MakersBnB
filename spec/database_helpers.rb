# frozen_string_literal: true

def add_space(title, price, description)
  click_button("Add space")
  fill_in("title", with: title)
  fill_in("price", with: price)
  fill_in("description", with: description)
  click_button("Create space")
end

def sign_up
  visit "/user/new"
  fill_in(:email, with: "test@example.com")
  fill_in(:password, with: "PASSword123")
  fill_in(:repeat_password, with: "PASSword123")
  click_button("Sign up")
end

def sign_up
      visit '/user/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'PASSword123')
      fill_in(:repeat_password, with: 'PASSword123')
      click_button('Sign up')
end
