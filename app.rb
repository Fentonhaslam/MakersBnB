require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:home)
  end

  # signup
  get '/user/new' do

  end

  # login
  get '/user' do

  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/spaces')
  end

  get '/spaces/new' do
    erb(:'spaces/new_spaces')
  end

  post '/spaces' do
    Space.create(title: params[:title], price: params[:price], description: [:description])
    redirect '/spaces'
  end

run! if app_file == $0
end
