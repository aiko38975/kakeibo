class RecordsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @record = Record.new
    @records = Record.all.order('created_at DESC')
    # @recorda = Record.find(params[:id])
    # @date =  @recorda.datetime_column.to_date
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

  def edit
  end

  def update
  end
  

  private
  def record_params
    params.require(:record).permit(:recorded_at, :spending_way_id, :spending_pay_id, :price, :description).merge(user_id: current_user.id)
  end
end
