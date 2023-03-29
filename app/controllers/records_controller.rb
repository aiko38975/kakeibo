class RecordsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @record = Record.new
  end
  
  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    
    if @record.save
      redirect_to records_path
    else
      render records_path
    end
  end

  private
  def record_params
    params.require(:record).permit(:recorded_at, :spending_way_id, :price, :description).merge(user_id: current_user.id)
  end
end
