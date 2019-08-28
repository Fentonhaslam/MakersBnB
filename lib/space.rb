class Space
  attr_reader :id, :description, :title, :price

  def initialize(id:, title:, price:, description:)
    @id = id
    @title = title
    @price = price
    @description = description
    @available = 1
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space|
      Space.new(
        id: space['id'],
        title: space['title'],
        price: space['price'],
        description: space['description']
      )
    end
  end

  def self.create(title:, price:, description:)
    result = DatabaseConnection.query("INSERT INTO spaces (title, price, description, available) VALUES('#{title}', '#{price}', '#{description}', '1') RETURNING id, title, price, description")
    Space.new(
      id: result[0]["id"], 
      title: result[0]["title"], price: 
      result[0]["price"], description: 
      result[0]["description"], 
      )
  end

  def available?
    @available == 1
  end
end
