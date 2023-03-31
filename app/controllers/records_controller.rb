class RecordsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @record = Record.new
    # @records = Record.all.order('recorded_at DESC')
 
    if params[:recorded_at].present?
      binding.pry
      year = params[:recorded_at][:year].to_i
      month = params[:recorded_at][:month].to_i
    else
      # デフォルトで今月を表示する
      year = Date.today.year
      month = Date.today.month
    end
    date = Date.new(year, month)
    @records = Record.where(recorded_at: date.beginning_of_month..date.end_of_month).order('recorded_at DESC')
  end
  
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path
    else
      redirect_to records_path
    end
  end

  def show
    
  end


  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    @record = Record.find(params[:id])
    if @record.destroy
      redirect_to records_path
    end
  end


  private
  def record_params
    params.require(:record).permit(:recorded_at, :spending_way_id, :spending_pay_id, :price, :description).merge(user_id: current_user.id)
  end
end
