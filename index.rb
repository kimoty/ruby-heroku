require 'rubygems'
require 'sinatra'

configure :production do

end

get '/' do
  "hello"
  #erb :index
end
