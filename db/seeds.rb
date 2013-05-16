# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'CREATING ROLES'
Role.create([
  { :name => 'admin' }, 
  { :name => 'user' }
], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'admin', :email => 'admin@admin.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << user.name
user2 = User.create! :name => 'user', :email => 'user@user.com', :password => 'password', :password_confirmation => 'password'
puts 'New user created: ' << user2.name
user.add_role :admin
user2.add_role :user