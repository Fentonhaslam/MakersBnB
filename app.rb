require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:home)
  end

  get '/spaces' do
    'List of spaces'
    erb(:'spaces/spaces')
  end

  get '/spaces/new' do
    p 'Hello world'
    erb(:'spaces/new_spaces')
  end

run! if app_file == $0
end