require "space"

describe Space do
  describe ".all" do
    it "returns a list of spaces" do
      # DatabaseConnection.query("INSERT INTO spaces (title, price, description) VALUES('London Flat', '100', '2 bed flat in London')")
      # DatabaseConnection.query("INSERT INTO spaces (title, price, description) VALUES('Countryside Mansion', '300', 'Luxury mansion in countryside')")
      # spaces = Space.all

      # expect(spaces).to include("2 bed flat in London")
      # expect(spaces).to include("Countryside Mansion")

      space = Space.create(title: "London Flat", price: "100", description: "2 bed flat in London")
      Space.create(title: "Countryside Mansion", price: "300", description: "Luxury mansion in countryside")

      spaces = Space.all


      expect(spaces.length).to eq 2
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq space.id
      expect(spaces.first.title).to eq "London Flat"
      expect(spaces.first.price).to eq "100"
      expect(spaces.first.description).to eq "2 bed flat in London"
    end
  end

  describe ".create" do
    it "creates a new space" do
      space = Space.create(title: "London Flat", price: "100", description: "2 bed flat in London")
      expect(space).to be_a Space
      expect(space.title).to eq("London Flat")
      expect(space.price).to eq "100"
      expect(space.description).to eq("2 bed flat in London")
    end
  end
end
