class VisitorsController < ApplicationController
  before_action :landing_page, only: [:landing, :create]

  def landing
    @visitor = Visitor.new
  end

  def create

    @visitor = Visitor.new(params[:visitor].permit(:email))
    @visitor.increment
    @visitor.apply_conditions
    
    winner_msg = if @visitor.prize
      "You have earned a prize (#{@visitor.prize.name})"
    end

    if @visitor.save
      flash[:notice] = 'You have been subscribed successfully.' + (winner_msg || "")
      redirect_to root_path
    else
      render 'landing'
    end
  end

  private
  def landing_page
    redirect_to prizes_path if admin_signed_in?
  end
end
