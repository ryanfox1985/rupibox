
if Pin.table_exists?
  pins = Pin.all
  pins.each do |pin|
    pin.save
    puts "Restoring state => #{pin.inspect}"
  end
end
