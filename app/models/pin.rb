# == Schema Information
#
# Table name: pins
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  pin_pi     :integer
#  updated_at :datetime         not null
#  value      :boolean          default(FALSE)
#

class Pin < ActiveRecord::Base
  after_save :set_value

  def exec_cmd(cmd)
    begin
      logger.debug "EXECUTING => #{cmd}"
      return system(cmd)
    rescue E => e
      puts e
    end

    false
  end

  def up_device
    unless File.exist?("/sys/class/gpio/gpio#{pin_pi}")
      if File.exist?('/sys/class/gpio/export')
        exec_cmd("echo #{pin_pi} > /sys/class/gpio/export")
      end
    end
  end

  def set_value
    logger.debug "START => Set value: pin#{pin_pi} = #{value};"
    up_device

    if File.exist?("/sys/class/gpio/gpio#{pin_pi}/direction")
      if value
        exec_cmd("echo out > /sys/class/gpio/gpio#{pin_pi}/direction")
      else
        exec_cmd("echo in > /sys/class/gpio/gpio#{pin_pi}/direction")
      end
    end

    logger.debug "END => Set value: pin#{pin_pi} = #{value};"
  end
end
