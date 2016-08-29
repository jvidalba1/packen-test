class VisitorsController < ApplicationController
  # before_action :authenticate_admin!

  def landing
    @visitor = Visitor.new
  end

  def create

    @visitor = Visitor.new(params[:visitor].permit(:email))
    @visitor.increment
    @visitor.apply_conditions
    
    winner_msg = if @visitor.prize
      "You have earned a prize (#{@visitor.prize.name})"
    else
      "You haven't earned a prize, sorry."
    end

    if @visitor.save
      flash[:notice] = 'You have been subscribed successfully.' + winner_msg
      redirect_to root_path
    else
      render 'landing'
    end
  end
end
