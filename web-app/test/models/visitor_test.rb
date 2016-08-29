# == Schema Information
#
# Table name: visitors
#
#  id                :integer          not null, primary key
#  email             :string
#  subscriber_number :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  prize_id          :integer
#  condition_id      :integer
#

require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
