class Prize < ActiveRecord::Base
  has_many :visitors
  has_many :conditions
end
