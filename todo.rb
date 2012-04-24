require 'rubygems'
require 'dm-core'

class Todo
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :todo, String
  property :dateTime, DateTime
end
