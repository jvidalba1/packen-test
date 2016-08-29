# == Schema Information
#
# Table name: conditions
#
#  id                :integer          not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  subscriber_number :integer
#  prize_id          :integer
#  type_cond         :string
#  rule              :string
#

require 'test_helper'

class ConditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
