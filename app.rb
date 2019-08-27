require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:home)
  end

  get '/spaces' do
    'List of spaces'
  end

run! if app_file == $0
end