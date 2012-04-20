require 'rubygems'
require 'sinatra'
require 'sequel'
require 'dm-core'
require 'dm-migrations'

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'sqlite3://db.sqlite3')



configure :production do

end


#class Todo
#	include DataMapper::Resource
#	property :id, Serial
#	property :todo, Text
#	auto_upgrade!
#end


get '/' do
  #"hello"
  erb :index
end
