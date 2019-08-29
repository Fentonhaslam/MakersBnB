feature "authentication" do
  it "a user can sign up" do
    User.create(email: "test@example.com", password: "password123")

    visit "/user/new"
    fill_in(:email, with: "test@example.com")
    fill_in(:password, with: "password123")
    fill_in(:repeat_password, with: "password123")
    click_button("Sign up")
    expect(page).to have_content "Welcome, test@example.com"
    expect(:password).to eq(:password)
  end

  it "a user can log in" do
    User.create(email: "test@example.com", password: "password123")
    visit "/user/"
    fill_in(:Email, with: "test@example.com")
    fill_in(:password, with: "password123")
    click_button("Log in")
    expect(page).to have_content "Welcome, test@example.com"
    expect(:password).to eq(:password)
  end

  it "raise an error if the password is wrong" do
    User.create(email: "test@example.com", password: "password123")
    visit "/user/"
    fill_in(:Email, with: "test@example.com")
    fill_in(:password, with: "test123")
    click_button("Log in")
    expect(page).not_to have_content "Welcome, test@example.com"
  end
  it "raise an error if the email is wrong" do
    User.create(email: "test@example.com", password: "password123")
    visit "/user/"
    fill_in(:Email, with: "test@exle.com")
    fill_in(:password, with: "password123")
    click_button("Log in")
    expect(page).not_to have_content "Welcome, test@example.com"
  end
end
