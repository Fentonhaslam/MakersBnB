# frozen_string_literal: true
require 'bcrypt'
require 'email_validator'

class User

  attr_reader :id, :email

  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    return 'Email must be a valid format: Please try again' if EmailValidator.invalid?(email)
    return 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase and 1 digit' unless is_complex?(password)
    email_check = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return 'Email already exists: Please try again' if email_check.any?

    encrypted_password = BCrypt::Password.create(password)

    result = DatabaseConnection.query("INSERT INTO users (email, password) VALUES('#{email}', '#{encrypted_password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT id, email FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.email?(email)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
    result.any?
  end

  private

  def self.is_complex?(password)
    password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])/
  end

end
