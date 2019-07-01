require 'sinatra/base'
require './lib/user.rb'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup/new' do
    session[:user] = User.create(params[:username], params[:email], params[:password])
    redirect "/home"
  end

  get '/home' do
    @user = session[:user]
    erb :home
  end

  run! if app_file == $0
end
