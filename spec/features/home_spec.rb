# frozen_string_literal: true

feature "MakerBnb" do
  feature "Homepage" do
    scenario "Can show button to all spaces" do
      visit("/")
      expect(page).to have_button("List of spaces")
    end

    scenario "A user can see a list of spaces" do
      sign_up
      add_space("London flat", 100, "2 bed flat in London")
      add_space("Countryside mansion", 300, "Luxury mansion in the countryside")
      expect(page).to have_content "London flat"
      expect(page).to have_content 100
      expect(page).to have_content "2 bed flat in London"
      expect(page).to have_content "Countryside mansion"
      expect(page).to have_content 300
      expect(page).to have_content "Luxury mansion in the countryside"
      expect(page).to have_button("Add space")
    end
  end
  feature "Spaces" do
    scenario "can create a new spaces" do
      visit("/spaces")
      click_button("Add space")
      expect(page).to have_button("Create space")
    end
  end
end
