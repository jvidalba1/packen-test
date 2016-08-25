class Visitor < ActiveRecord::Base
  belongs_to :prize

  enum status: [:winner, :loser]
  # after_save :won?

  def increment
    self.subscriber_number = first_visitor? ? 1 : Visitor.count + 1
  end

  def first_visitor?
    Visitor.count == 0
  end

  def prize
    Condition.all.select {|c| c.subscriber_number == self.subscriber_number }
  end
end
