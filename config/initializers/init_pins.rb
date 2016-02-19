Rails.logger.debug '#### PINS Initializations ####'

if Pin.table_exists?
  pins = Pin.all
  pins.each do |pin|
    Rails.logger.debug "#### Restoring state => #{pin.inspect}"
    pin.set_value
  end
end
