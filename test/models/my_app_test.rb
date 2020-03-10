require 'test_helper'

class MyAppTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

#Does it work if there's no start/end/max
#Does it work if there's just an end
#Does end take presedence over max when it is smaller
#Does max take presedence over end when it is smaller
#If the user enters x as start, does it start at array
