# frozen_string_literal: true

require './lib/database_connection.rb'

def database_connection_setup
  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('makersbnb_test')
  else
    DatabaseConnection.setup('makersbnb')
  end
end

def persisted_data(table:, id:)
  DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
