# frozen_string_literal: true

require './database_connection_setup'
require 'user'

describe 'User' do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@mail.com', password: 'PASSword123')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@mail.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('PASSword123')

      User.create(email: 'test@mail.com', password: 'PASSword123')
    end

    it 'cannot create two users with the same email' do
      user = User.create(email: 'test@mail.com', password: 'PASSword123')
      duplicate_user = User.create(email: 'test@mail.com', password: 'PASSword234')


      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@mail.com'

      expect(duplicate_user).to eq 'Email already exists: Please try again'
    end

    it 'checks that the user enters a correct email' do
      user = User.create(email: 'testmailcom', password: 'PASSword123')
      expect(user).to eq 'Email must be a valid format: Please try again'
    end

    it 'checks that the user enters a correct email' do
      user = User.create(email: 'test@mailcom', password: 'pass')
      expect(user).to eq 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase and 1 digit'
    end

  end

  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@mail.com', password: 'PASSword123')
      result = User.find(id: user.id)

      expect(user).to be_a User
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct email and password' do
      user = User.create(email: 'text@example.com', password: 'PASSword123')
      authenticate_user = User.authenticate(email: 'text@example.com', password: 'PASSword123')

      expect(authenticate_user.id).to eq user.id
    end
  end
end
