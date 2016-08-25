class Visitor < ActiveRecord::Base
  belongs_to :prize

  enum status: [:winner, :loser]

  def visitors_count

  end

  def first_visitor?
    self.count == 0
  end

  def won?
  end
end
