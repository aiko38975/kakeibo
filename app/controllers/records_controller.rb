class RecordsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_record, only: [:edit, :update, :destroy]

  def index
    @record = Record.new
    @records = Record.includes(:user).order("recorded_at DESC")
    @form = Form::RecordCollection.new
  end
  
  def new
    @record = Record.new
  end

  def create
    # 以下コメントアウト部分は、1件登録用
    # @record = Record.new(record_params)
    # if @record.save
    #   redirect_to records_path
    # else
    #   redirect_to records_path
    # end
    # binding.pry
    @form = Form::RecordCollection.new(record_collection_params)
    # binding.pry
    if @form.save
      redirect_to records_path
    else
      redirect_to records_path
    end
  end

  def show 
    @records = Record.includes(:user).order("created_at DESC")
  end

  def search
    @records = Record.search(params[:recorded_at])
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to records_path
    else
      render :edit
    end
  end

  def destroy
    if @record.destroy
      redirect_to records_path
    end
  end

  private
  # def record_params
  #   params
  #   .require(:record)
  #   .permit(:recorded_at, :spending_way_id, :spending_pay_id, :price, :description).merge(user_id: current_user.id)
  # end

  def record_collection_params
    params
    .require(:form_record_collection)
    .permit(records_attributes [:recorded_at, :spending_way_id, :spending_pay_id, :price, :description]).merge(user_id: current_user.id)
  end

  

  def set_record
    @record = Record.find(params[:id])
  end

end
