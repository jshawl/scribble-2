# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all

jsm = User.create(username: "jsm", password_digest: "1234")
jsm.posts.create(title: "First Post", body: "My opinions on something...")
jsm.posts.create(title: "Second Post", body: "Yet another opinion - possibly on something else, possibly on the same thing...")
