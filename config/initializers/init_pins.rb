puts '#### PINS Initializations ####'

if Pin.table_exists?
  pins = Pin.all
  pins.each do |pin|
    puts "#### Restoring state => #{pin.inspect}"
    pin.set_value
  end
end
