require 'rubygems'
require 'dm-core'

class Todo
  include DataMapper::Resource
  property :id, Serial
  property :todo, String
end
