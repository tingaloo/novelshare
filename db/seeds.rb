# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

Book.create("title" => "Hot Dog",         "author" =>"Dog", "user_id"=>5)
Book.create("title" => "Peanut Butter",   "author" =>"Jelly", "user_id"=>5)
Book.create("title" => "GoodHell",        "author" =>"Hell", "user_id"=>5)
Book.create("title" => "Galantis",        "author" =>"Box", "user_id"=>5)
Book.create("title" => "Charlotte's Web", "author" =>"Cash", "user_id"=>5)
Book.create("title" => "Funn",            "author" =>"Cash", "user_id"=>5)
