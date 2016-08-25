class Condition < ActiveRecord::Base
  has_many :visitors
  belongs_to :prize
end
