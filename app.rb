require "sinatra/base"
require_relative "./lib/space"
require_relative "./lib/user"
require_relative "./database_connection_setup"
require "sinatra/flash"

class MakersBnb < Sinatra::Base
  enable :sessions
  database_connection_setup

  get "/" do
    erb(:home)
  end

  # signup
  get "/user/new" do
    @email = session[:email]
    erb(:sign_up)
  end

  post "/user/new" do
    user = User.create(email: params[:email], password: params[:password])
    session[:id] = user.id
    p user
    redirect "/spaces"
  end

  # login
  get "/user/" do
    erb(:log_in)
  end

  post "/user/login" do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:id] = user.id
      redirect("/spaces")
    else
      flash[:notice] = "Please check your email or password."
      redirect("/user/login")
    end
    redirect "/spaces"
  end

  get "/spaces" do
    p session
    @user = User.find(id: session[:id])
    @spaces = Space.all
    erb(:'spaces/spaces')
  end

  get "/spaces/new" do
    erb(:'spaces/new_spaces')
  end

  post "/spaces" do
    p params
    Space.create(title: params[:title], price: params[:price], description: params[:description])
    redirect "/spaces"
  end

  run! if app_file == $0
end
