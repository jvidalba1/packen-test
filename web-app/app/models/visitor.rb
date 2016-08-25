class Visitor < ActiveRecord::Base
  belongs_to :prize

  enum status: [:winner, :loser]

  def increment
    self.subscriber_number = first_visitor? ? 1 : Visitor.count + 1
  end

  def first_visitor?
    Visitor.count == 0
  end

  def won?
  end
end
