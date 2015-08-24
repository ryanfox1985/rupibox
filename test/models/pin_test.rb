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

require 'test_helper'

class PinTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
