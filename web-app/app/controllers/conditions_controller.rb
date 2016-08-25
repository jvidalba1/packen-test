class ConditionsController < ApplicationController

  before_action :authenticate_admin!
  before_action :set_condition, only: [:show, :edit, :update, :destroy]

  def index
    @conditions = Condition.all.includes(:prize)
  end

  def new
    @condition = Condition.new
  end

  def create
    @condition = Condition.new(condition_params)
    # raise "oelo"
    if @condition.save
      redirect_to @condition, notice: 'Condition was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @condition.update(condition_params)
      redirect_to @condition, notice: 'Condition was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @condition.destroy
    redirect_to conditions_url, notice: 'Condition was successfully destroyed.'
  end

  private
    def set_condition
      @condition = Condition.find(params[:id])
    end

    def condition_params
      params.require(:condition).permit(:subscriber_number, :type_cond, :rule, :prize_id)
    end

end
