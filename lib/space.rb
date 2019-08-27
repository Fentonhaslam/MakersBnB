
class Space
  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces')
    spaces = []
    result.each do |space|
      spaces.push(space['title'])
      spaces.push(space['price'])
      spaces.push(space['description'])
    end
    return spaces
  end
end
