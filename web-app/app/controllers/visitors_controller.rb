class VisitorsController < ApplicationController
  # before_action :authenticate_admin!

  def landing
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(params[:visitor].permit(:email))
    @visitor.increment
    
    if @visitor.save
    else
    end
  end
end
