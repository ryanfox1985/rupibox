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

  def set_value
    if File.exist?('/sys/class/gpio/export')
      exec_cmd("echo #{pin_pi} > /sys/class/gpio/export")

      if File.exist?("/sys/class/gpio/gpio#{pin_pi}/direction")
        if value
          exec_cmd("echo out > /sys/class/gpio/gpio#{pin_pi}/direction")
        else
          exec_cmd("echo in > /sys/class/gpio/gpio#{pin_pi}/direction")
        end
      end
    end
  end

  def exec_cmd(cmd)
    begin
      exec cmd
    rescue E => e
      puts e
    end
  end
end
