require 'sinatra/base'

require_relative './lib/user'
require_relative './lib/space'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/' do
    erb :home
  end

  get '/signup' do
    erb :signup
  end


  post '/signup/new' do
    user = User.create(username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = user.id
    redirect '/listings'
  end


  get '/listings' do
  @username = User.find(id: session[:user_id].to_i)
    erb :listings
  end

  post '/listings/confirm' do
    space = Space.create(owner_id: session[:user_id], name: params['name'], description: params['description'], price: params['price'])
    session[:space_id] = space.id
    @space = Space.find(id: session[:space_id])
    erb :confirm
  end

  run! if app_file == $0
end
