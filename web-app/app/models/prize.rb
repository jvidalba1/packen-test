# == Schema Information
#
# Table name: prizes
#
#  id         :integer          not null, primary key
#  stock      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string
#

class Prize < ActiveRecord::Base
  has_many :visitors
  has_many :conditions

  validates :stock, presence: true
  validates_numericality_of :stock
  validates :name, presence: true
end
