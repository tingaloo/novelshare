# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Book.create("title" => "Blink: The Power of Thinking Without Thinking", "author" =>"Malcolm Gladwell", "user_id"=>1)
Book.create("title" => "Sophie's World",       "author" =>"Jostein Gaarder", "user_id"=>1)
Book.create("title" => "Fifty Shades of Grey", "author" =>"E L James",      "user_id"=>1)
