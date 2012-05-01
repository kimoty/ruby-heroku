require 'rubygems'
require 'dm-core'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :password, String
  property :firstLogin, DateTime
  property :lastLogin, DateTime
end
