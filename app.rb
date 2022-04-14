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
    @bookmark_id = params[:id]
    erb :'bookmarks/edit'
  end

  # in app.rb

  patch '/bookmarks/:id' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec_params("UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3",[ params[:url], params[:title], params[:id] ])
    redirect('/bookmarks')
end
  # # Start the server if this file is executed directly (do not change the line below)
  run! if app_file == $0
end
