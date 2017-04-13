# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Seeding Database!"

User.destroy_all

USERS = [
  {
    first_name: "John",
    last_name: "Doe",
    email: "jdoe@gmail.com",
    password_digest: "jdoe",
    confirm_password_digest: "jdoe"
  }
]

User.create(USERS)
p "#{User.count} Users created!"
