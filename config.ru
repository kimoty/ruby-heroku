require 'rubygems'
require 'dm-core'
require 'dm-migrations'
require 'dm-sqlite-adapter'
require 'bundler'
require 'erb'

Bundler.require

require './index.rb'
run Sinatra::Application
