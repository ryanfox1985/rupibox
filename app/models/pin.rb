# == Schema Information
#
# Table name: pins
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  pin_pi     :integer
#  updated_at :datetime         not null
#  value      :boolean
#

class Pin < ActiveRecord::Base
  after_save :set_value

  private

  def exec_cmd(cmd)
    begin
      puts "EXECUTING => #{cmd}"
      exec cmd
    rescue E => e
      puts e
    end
  end

  def up_device
    unless File.exist?("/sys/class/gpio/gpio#{pin_pi}")
      if File.exist?('/sys/class/gpio/export')
        exec_cmd("echo #{pin_pi} > /sys/class/gpio/export")
      end
    end
  end

  def set_value
    puts "Set value: pin#{pin_pi} = #{value};"
    up_device

    if File.exist?("/sys/class/gpio/gpio#{pin_pi}/direction")
      if value
        exec_cmd("echo out > /sys/class/gpio/gpio#{pin_pi}/direction")
      else
        exec_cmd("echo in > /sys/class/gpio/gpio#{pin_pi}/direction")
      end
    end
  end
end
