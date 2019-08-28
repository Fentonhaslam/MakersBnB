require './database_connection_setup'
require 'user'

describe 'User' do
  describe '.create' do
    it 'creates a new user' do
      user = User.create(email: 'test@mail.com', password: 'test123')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'test@mail.com'
    end
  end
  describe '.find' do
    it 'finds a user by ID' do
      user = User.create(email: 'test@mail.com', password: 'test123')
      result = User.find(id: user.id)

      expect(user).to be_a User
      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end
  end
end
