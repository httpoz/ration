# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: "oskar_norin@hotmail.com", password: "password",
                     password_confirmation: "password" )
                     
user.budgets.create(name: "My first budget")

["Rent", "Car", "Food", "Fun", "Bills"].each do |name| 
  Category.create(name: name)
end