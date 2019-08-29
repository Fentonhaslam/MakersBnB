# frozen_string_literal: true

feature 'authentication' do
  feature 'Sign up' do
    scenario 'a user can sign up' do
      visit '/user/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      fill_in(:repeat_password, with: 'password123')
      click_button('Sign up')
      expect(page).to have_content 'Welcome, test@example.com'
      expect(:password).to eq(:password)
    end

    scenario 'filling in different passwords fails sign up' do
      visit '/user/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      fill_in(:repeat_password, with: 'fakepassword')
      click_button('Sign up')
      expect(page).to have_content 'Password does not match: Please try again'
    end

    scenario 'each email can only have one user' do
      User.create(email: 'test@example.com', password: 'password123')
      visit '/user/new'
      fill_in(:email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      fill_in(:repeat_password, with: 'password123')
      click_button('Sign up')
      expect(page).to have_content 'Email already exists: Please try again'
    end
  end

  feature 'log in' do
    scenario 'a user can log in' do
      User.create(email: 'test@example.com', password: 'password123')
      visit '/user/'
      fill_in(:Email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Log in')
      expect(page).to have_content 'Welcome, test@example.com'
      expect(:password).to eq(:password)
    end

    scenario 'raise an error if the password is wrong' do
      User.create(email: 'test@example.com', password: 'password123')
      visit '/user/'
      fill_in(:Email, with: 'test@example.com')
      fill_in(:password, with: 'test123')
      click_button('Log in')
      expect(page).not_to have_content 'Welcome, test@example.com'
    end

    scenario 'raise an error if the email is wrong' do
      User.create(email: 'test@example.com', password: 'password123')
      visit '/user/'
      fill_in(:Email, with: 'test@exle.com')
      fill_in(:password, with: 'password123')
      click_button('Log in')
      expect(page).not_to have_content 'Welcome, test@example.com'
    end

    scenario 'can log out and session is cleared' do
      User.create(email: 'test@example.com', password: 'password123')
      visit '/user/'
      fill_in(:Email, with: 'test@example.com')
      fill_in(:password, with: 'password123')
      click_button('Log in')
      click_button('Log out')
      expect(page).to have_content 'You have logged out.'
    end
  end
end
