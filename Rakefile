require 'dm-core'
require 'dm-migrations'
require './todo.rb'
require './user.rb'

task 'db:migrate' do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3:db.sqlite3')
  DataMapper.auto_upgrade!
end


