require 'sinatra/base'
require_relative './lib/space'
require_relative './lib/user'
require_relative './database_connection_setup'

class MakersBnb < Sinatra::Base
  enable :sessions
  database_connection_setup

  get '/' do
    erb(:home)
  end

  # signup
  get '/user/new' do
    @email = session[:email]
    erb(:sign_up)
  end

  post '/user/new' do
    user = User.create(email: params[:email], password: params[:password])
    session[:email] = user.email
    p user.email
    p '12341234'
    redirect '/spaces'
  end

  # login
  get '/user/' do
    erb(:log_in)
  end

  post '/user/login' do
    #user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:email] = params[email]
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/user/login')
    end
    redirect '/spaces'
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/spaces')
  end

  get '/spaces/new' do
    erb(:'spaces/new_spaces')
  end

  post '/spaces' do
    p params
    Space.create(title: params[:title], price: params[:price], description: params[:description])
    redirect '/spaces'
  end

run! if app_file == $0
end
