# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "Calling seeds.rb file"

puts "Creating Users"
u1 =User.create!(username: "user1", email:"user1@gmail.com", password: "12345678")
u2 =User.create!(username: "user2", email:"user2@gmail.com", password: "12345678")
u1.start_follow(u2)
u2.start_follow(u1)


puts "Creating posts"

Post.create(message: "Hello World from Microblog", user_id: 1)
Post.create(message: "Hello World!", user_id: 1)

Post.create(message: "Voilà! Ça marche bien ce site!", user_id: 2)
Post.create(message: "Hello World!", user_id: 2)


puts "Creating admins"

Admin.create(email: "admin@gmail.com", password: "12345678")
