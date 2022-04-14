require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  enable :sessions, :method_override
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
    Bookmark.add_bookmark(url: params[:bname], title: params[:title])
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect '/bookmarks'
  end

  get '/bookmarks/:id/edit' do
    @bookmark = Bookmark.find(id: params[:id])
    erb :'bookmarks/edit'
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
end
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
