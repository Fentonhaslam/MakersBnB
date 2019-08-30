# frozen_string_literal: true

require 'sinatra/base'
require_relative './lib/space'
require_relative './lib/user'
require_relative './database_connection_setup'
require 'sinatra/flash'

class MakersBnb < Sinatra::Base
  enable :sessions
  database_connection_setup
  register Sinatra::Flash
  enable :method_override

  get '/' do
    erb(:home)
  end

  get '/user/new' do
    @email = session[:email]
    erb(:sign_up)

  end

  post '/user/new' do
    if params[:repeat_password] != params[:password]
      flash[:notice] = 'Password does not match: Please try again'
      redirect '/user/new'
    end

    user = User.create(email: params[:email], password: params[:password])

    if user.is_a? String
      flash[:notice] = user
      redirect '/user/new'
    end

    session[:id] = user.id
    redirect '/user/spaces'
  end

  get '/user/' do
    erb(:log_in)
  end

  post '/user/login' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      redirect('/user/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/user/')
    end
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:'spaces/spaces')
  end

  get '/user/spaces' do
    @user = User.find(id: session[:id])
    @spaces = Space.all
    erb(:'spaces/user_spaces')
  end

  get '/booking/:id/new' do
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
    Space.book(id: params[:id])
    redirect '/spaces'
  end

  post '/user/destroy' do
    session.clear
    flash[:notice] = 'You have logged out.'
    redirect '/'
  end




  run! if app_file == $PROGRAM_NAME
end
