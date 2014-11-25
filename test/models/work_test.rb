# == Schema Information
#
# Table name: works
#
#  id         :integer          not null, primary key
#  checkin    :datetime
#  checkout   :datetime
#  job        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
