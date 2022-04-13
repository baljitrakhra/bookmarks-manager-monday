require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @list = Bookmark.all
    erb :bookmarks
  end

  get '/form' do
    erb :form
  end

  post '/bookmarks/new' do
    redirect '/bookmarks'
  end
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
