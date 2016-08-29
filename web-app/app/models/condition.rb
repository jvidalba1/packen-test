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

class Condition < ActiveRecord::Base
  has_many :visitors
  belongs_to :prize
end
