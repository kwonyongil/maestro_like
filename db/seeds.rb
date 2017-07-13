# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




for i in 1..3
    User.create(
    :email => "123#{i}@123.com",
    :password => 123123,
    :password_confirmation => 123123,
    :name => "용일#{i}")
end