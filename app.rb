require 'sinatra/base'
require_relative './lib/space'
require_relative './database_connection_setup'

class MakersBnb < Sinatra::Base
  database_connection_setup
  enable :method_override

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

  get '/booking/:id/new' do
    p params
    @id = params[:id]
    erb(:'bookings/new')
  end

  get '/spaces/new' do
    erb(:'spaces/new_spaces')
  end

  post '/spaces' do
    Space.create(title: params[:title], price: params[:price], description: params[:description])
    redirect '/spaces'
  end

  patch '/spaces/:id' do
    p params
    Space.book(id: params[:id])
    redirect '/spaces'
  end

run! if app_file == $0
end
