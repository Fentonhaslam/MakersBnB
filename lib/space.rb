# frozen_string_literal: true

class Space
  attr_reader :id, :description, :title, :price

  def initialize(id:, title:, price:, description:, available:)
    @id = id
    @title = title
    @price = price
    @description = description
    @available = available.to_i
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM spaces')
    result.map do |space|
      Space.new(
        id: space['id'],
        title: space['title'],
        price: space['price'],
        description: space['description'],
        available: space['available']
      )
    end
  end

  def self.create(title:, price:, description:)
    result = DatabaseConnection.query("INSERT INTO spaces (title, price, description, available) VALUES('#{title}', '#{price}', '#{description}', '1') RETURNING id, title, price, description, available")
    Space.new(
      id: result[0]['id'],
      title: result[0]['title'],
      price: result[0]['price'],
      description: result[0]['description'],
      available: result[0]['available']
    )
  end

  def self.book(id:)
    result = DatabaseConnection.query("UPDATE spaces SET available = '0' RETURNING id, title, price, description, available")
    Space.new(
      id: result[0]['id'],
      title: result[0]['title'],
      price: result[0]['price'],
      description: result[0]['description'],
      available: result[0]['available']
    )
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM spaces WHERE id = '#{id}'")
  end


  def available?
    @available == 1
  end

  
end
