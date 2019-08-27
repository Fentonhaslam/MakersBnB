require "space"

describe Space do
  describe ".all" do
    it "returns a list of spaces" do
      DatabaseConnection.query("INSERT INTO spaces (title, price, description) VALUES('London Flat', '100', '2 bed flat in London')")
      DatabaseConnection.query("INSERT INTO spaces (title, price, description) VALUES('Countryside Mansion', '300', 'Luxury mansion in countryside')")
      spaces = Space.all

      expect(spaces).to include("2 bed flat in London")
      expect(spaces).to include("Countryside Mansion")
    end
  end

  describe ".create" do
    it "creates a new space" do
      space = Space.create(title: "London Flat", price: "100", description: "2 bed flat in London")
      p space.price
      expect(space).to be_a Space
      expect(space.title).to eq("London Flat")
      expect(space.price).to eq("100") #changed to match sql character of zero.
      expect(space.description).to eq("2 bed flat in London")
    end
  end
end
