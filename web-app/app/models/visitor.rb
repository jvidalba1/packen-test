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
#  created_on        :date
#

class Visitor < ActiveRecord::Base
  belongs_to :prize
  belongs_to :condition

  enum status: [:winner, :loser]

  validates :email, presence: true
  validates_uniqueness_of :email, conditions: -> { where(created_on: Date.today) }, message: "has already been taken today"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def increment
    self.subscriber_number = first_visitor? ? 1 : Visitor.count + 1
  end

  def apply_conditions
    conditions_with_subscriber_number.each do |c|
      if (c.type_cond.eql? 'normal') && (self.subscriber_number == c.subscriber_number)
        win_prize(c)
      elsif (c.type_cond.eql? 'multiplo') && (c.rule.eql? 'no') && (is_multiple?(c.subscriber_number))
        win_prize(c)
      elsif (c.type_cond.eql? 'multiplo') && (c.rule.eql? 'si') && (is_multiple?(c.subscriber_number)) && (self.subscriber_number > 1000)
        win_prize(c)
      else
        self.loser!
      end
    end
  end

  private 
    def win_prize(c)
      self.prize = c.prize
      self.condition = c
      self.winner!
      c.prize.decrement!(:stock, 1)
    end

    def conditions_with_subscriber_number
      Condition.select { |condition| condition.subscriber_number == self.subscriber_number }
    end

    def first_visitor?
      Visitor.count == 0
    end

    def is_multiple?(number)
      self.subscriber_number % number == 0
    end
end
