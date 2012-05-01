require './todo.rb'
require './user.rb'

enable :sessions


configure do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:db.sqlite3')
  DataMapper.finalize
end

template :layout do
  "<html><head></head><body><%= yield %></body></html>"
end


configure :production do

end


get '/todo' do
  auth
  @todos = Todo.all.reverse
  erb :todo
end

post '/todo' do
  Todo.create(:name => params[:name],:todo => params[:todo],:dateTime => Time.now)
  redirect '/todo'
end

delete '/todo/:id' do
  todo = Todo.get(params[:id])
  todo.destroy
  redirect '/todo'
end

get '/' do
redirect '/login'
end

get '/login' do
@users = User.first(:name => 'abc')
erb :login
end

post '/login' do
@user = User.first(:name => params[:name])

if @user == nil then
  redirect '/login'
else
  if @user[:password] == params[:password] then
    session[:name] = @user[:name]
    redirect '/todo'
  else
    redirect '/login'
  end
end

end

get '/logout' do
session[:name] = nil
redirect '/login'
end

get '/regist' do
erb :regist
end

post '/regist' do
User.create(:name => params[:name],:password => params[:password],:firstLogin => Time.now, :lastLogin => Time.now)

redirect '/login'
end


helpers do
  include Rack::Utils; alias_method :h, :escape_html
end

def auth
  if session[:name] == nil then
    redirect '/login'
  end
end
