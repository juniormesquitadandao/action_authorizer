# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chicago = Country::City.create name: 'Chicago'
copenhagen = Country::City.create name: 'Copenhagen'

admin_group = Group.create name: 'admin'
user_group = Group.create name: 'user'

admin = User.create email: 'admin@email.com', password: 'password', group: admin_group
one = User.create email: 'one@email.com', password: 'password', group: user_group
two = User.create email: 'two@email.com', password: 'password', group: user_group

House.create [
  { street: 'A', user: one, city: chicago },
  { street: 'B', user: one, city: copenhagen },
  { street: 'C', user: two, city: chicago }
]