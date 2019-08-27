require "space"

describe Space do
  describe ".all" do
    it "returns a list of spaces" do
      spaces = Space.all

      expect(spaces).to include("2 bed flat in London")
      expect(spaces).to include("mansion in countryside")
      expect(spaces).to include("Chalet in alpes")
    end
  end
end
