# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def create_pin(pin_pi, attributes = {})
  pin = Pin.find_by(pin_pi: pin_pi)
  if pin.nil?
    pin = Pin.create(attributes)
    puts "### Creating #{pin.inspect}"
  end

  pin
end

create_pin(17, {name: 'Plug 0', pin_pi: 17, value: false})
create_pin(27, {name: 'Plug 1', pin_pi: 27, value: false})
create_pin(17, {name: 'Plug 2', pin_pi: 22, value: false})
create_pin(17, {name: 'Plug 3', pin_pi: 23, value: false})
