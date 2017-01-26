ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require './app/dmconfig'

class Bookmarks < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'top secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    'Hello Bookmarks!'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = user.id
      redirect '/links'
    else
      flash.now[:notice] = 'Please enter your password again'
      erb :'users/new'
    end
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/add' do
    erb :add
  end

  post '/create' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |name|
      tag =  Tag.first_or_create(name: name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  post '/sign_up' do
    session[:email] = params[:email]
    session[:password] = params[:password]
    redirect '/links'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
