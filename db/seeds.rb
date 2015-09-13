# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pin1 = Pin.find_or_create_by(pin_pi: 17)
pin1.attributes = {name: 'Plug 0', pin_pi: 17, value: false}
pin1.save

pin2 = Pin.find_or_create_by(pin_pi: 27)
pin2.attributes = {name: 'Plug 1', pin_pi: 27, value: false}
pin2.save

pin3 = Pin.find_or_create_by(pin_pi: 22)
pin3.attributes = {name: 'Plug 2', pin_pi: 22, value: false}
pin3.save

pin4 = Pin.find_or_create_by(pin_pi: 23)
pin4.attributes = {name: 'Plug 3', pin_pi: 23, value: false}
pin4.save
