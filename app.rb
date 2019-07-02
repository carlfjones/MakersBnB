require 'sinatra/base'

require_relative './lib/user'
require_relative './lib/space'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/signup' do
    erb :signup
  end


  get '/home' do
  #  @username = session[:user_id]
  @username = User.find(id: session[:user_id])
    erb :home
  end

  post '/signup/new' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/home'
  end

  get '/home' do
    @user = session[:user]
    erb :home
  end

  run! if app_file == $0
end
