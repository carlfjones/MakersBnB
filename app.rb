require 'sinatra/base'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/signup' do
    erb :signup
  end

  get '/home' do
    @username = session[:user]
    erb :home
  end

  post '/signup/new' do
    session[:user] = params[:username]
    redirect "/home"
  end

  run! if app_file == $0
end
