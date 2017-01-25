ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/dmconfig'

class Bookmarks < Sinatra::Base

  enable :sessions

  get '/' do
    'Hello Bookmarks!'
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

  # start the server if ruby file executed directly
  run! if app_file == $0
end
