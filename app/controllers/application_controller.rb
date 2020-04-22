require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @articles = Article.create(params)
    redirect to "/articles/#{@articles.id}"
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/:id' do
    @articles = Article.find_by_id(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do
    @articles = Article.find_by_id(params[:id])
   erb :edit
  end

  patch '/articles/:id' do
    id = params[:id]
       new_params = {}
       old = Article.find(id)
       new_params[:title] = params[:title]
       new_params[:content] = params[:content]
       old.update(new_params)

    redirect to "/articles/#{@articles.id}"
  end


  delete '/posts/:id/delete' do
    @articles = Article.find_by_id(params[:id])
    @articles.destroy
    erb :delete
  end

end
