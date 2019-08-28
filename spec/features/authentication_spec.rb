feature "authentication" do
  it "a user can sign in" do
    User.create(email: "test@example.com", password: "password123")

    visit ""
  end
end
