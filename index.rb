require 'erb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:db.sqlite3')

configure :production do

end


class Todo
  include DataMapper::Resource
  property :id, Serial
  property :todo, String
  auto_upgrade!
end


get '/' do
  erb :index
end

get '/todo' do
  @todos = Todo.all
  erb :todo
end


post '/todo' do
  Todo.create(:todo => params[:todo])
  redirect '/todo'
end


helpers do
  include Rack::Utils; alias_method :h, :escape_html
end
