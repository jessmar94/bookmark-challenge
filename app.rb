require 'sinatra/base'

class Bookmarks < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/bookmarks' do
    "Bookmark1"
  end

  run! if app_file == $0
end
