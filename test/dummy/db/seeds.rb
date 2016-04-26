# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
one = User.create email: 'one@email.com', password: 'password'
two = User.create email: 'two@email.com', password: 'password'

House.create [
  { street: 'A', user: one},
  { street: 'B', user: one},
  { street: 'C', user: two}
]