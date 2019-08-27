require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:home)
  end

  get '/spaces' do
    @spaces = [
      "London flat",
      "Surrey mansion",
      "Sussex cottage"
    ]
    erb(:'spaces/spaces')
  end

  get '/spaces/new' do
    p 'Hello world'
    erb(:'spaces/new_spaces')
  end

run! if app_file == $0
end