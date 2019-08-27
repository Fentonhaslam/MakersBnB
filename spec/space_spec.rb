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
end
