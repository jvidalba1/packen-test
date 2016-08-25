class Visitor < ActiveRecord::Base
  belongs_to :prize
  belongs_to :condition

  enum status: [:winner, :loser]

  def increment
    self.subscriber_number = first_visitor? ? 1 : Visitor.count + 1
  end

  def apply_conditions
    Condition.all.each do |c|
      if (c.type_cond.eql? 'normal') && (self.subscriber_number == c.subscriber_number)
        win_prize(c)
      elsif (c.type_cond.eql? 'multiplo') && (c.rule.eql? 'no') && (is_multiple?(c.subscriber_number))
        win_prize(c)
      elsif (c.type_cond.eql? 'multiplo') && (c.rule.eql? 'si') && (is_multiple?(c.subscriber_number)) && (self.subscriber_number > 1000)
        win_prize(c)
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

    def first_visitor?
      Visitor.count == 0
    end

    def is_multiple?(number)
      self.subscriber_number % number == 0
    end
end
