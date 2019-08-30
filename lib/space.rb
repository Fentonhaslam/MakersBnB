# frozen_string_literal: true

class Space
  attr_reader :id, :description, :title, :price, :user_id

  def initialize(id:, title:, price:, description:, available:, user_id:)
    @id = id
    @title = title
    @price = price
    @description = description
    @available = available.to_i
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM spaces")
    result.map do |space|
      Space.new(
        id: space["id"],
        title: space["title"],
        price: space["price"],
        description: space["description"],
        available: space["available"],
        user_id: result[0]["user_id"],
      )
    end
  end

  def self.create(title:, price:, description:, user_id:)
    result = DatabaseConnection.query("INSERT INTO spaces (title, price, description, available, user_id) VALUES('#{title}', '#{price}', '#{description}', '1', '#{user_id}') RETURNING id, title, price, description, available, user_id")
    Space.new(
      id: result[0]["id"],
      title: result[0]["title"],
      price: result[0]["price"],
      description: result[0]["description"],
      available: result[0]["available"],
      user_id: result[0]["user_id"],
    )
  end

  def self.book(id:)
    result = DatabaseConnection.query("UPDATE spaces SET available = '0' RETURNING id, title, price, description, available, user_id")
    Space.new(
      id: result[0]["id"],
      title: result[0]["title"],
      price: result[0]["price"],
      description: result[0]["description"],
      available: result[0]["available"],
      user_id: result[0]["user_id"],
    )
  end

  def user(user_class = User)
   user_class.find(id: @user_id)
  end

  def available?
    @available == 1
  end
end
