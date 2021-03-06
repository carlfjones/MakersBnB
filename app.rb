require 'sinatra/base'

require_relative './lib/user'
require_relative './lib/space'
require_relative './lib/request'


class Makersbnb < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    erb :home
  end

  get '/signup' do
    erb :signup
  end

  get '/sessions' do
    erb :sessions_new
  end


  post '/signup/new' do
    session[:user] = User.create(username: params['username'], email: params['email'], password: params['password'])
    redirect '/listings/all'
  end

  post '/sessions/new' do
    session[:user] = User.authenticate(username: params['username'], password: params['password'])
    @user = session[:user]
    redirect '/listings/all'
  end

  get '/listings' do
    id = session[:user].id.to_i
    @username = User.find(id: id)
    erb :listings
  end

  post '/listings/confirm' do
    id = session[:user].id.to_i
    space = Space.create(owner_id: id, name: params['name'], description: params['description'], price: params['price'])
    session[:space_id] = space.id
    @space = Space.find(id: session[:space_id])
    redirect '/listings/all'
  end

  get '/listings/all' do
    $spaces = Space.viewall
    @user = session[:user]
    erb :all_listings
  end

  get '/listings/:id' do
    $spaces.each do |space|
      if space.id == params[:id]
        @found_space = space
      end
    end
    session[:space] = @found_space
    erb :space
  end

  post '/requesting' do
    @user = session[:user]
    @space = session[:space]
    @requested_space = Request.request_booking(@user.id, @space.id, from_date='2001-12-21', to_date='2001-12-23')
    redirect '/success'
  end

  get '/success' do
    @user = session[:user]
    @space = session[:space]
    erb :success
  end

  get '/requests' do
    id = session[:user].id
    @landlordrequests = Request.landlord_view_all_requests(id)
    @tenantrequests = Request.tenant_view_all_requests(id)
    erb :requests
  end

  run! if app_file == $0
end
