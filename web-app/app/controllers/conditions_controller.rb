class ConditionsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def index
    @conditions = Condition.all
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    # raise "oelo"
    if @condition.save
      redirect_to @condition, notice: 'Prize was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  private
    def set_condition
      @condition = Condition.find(params[:id])
    end

    def condition_params
      params.require(:condition).permit(:prize_id, :subscriber_number)
    end

end
