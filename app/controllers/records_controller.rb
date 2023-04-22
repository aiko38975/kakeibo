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
    # 以下、1件登録用
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path
    else
      redirect_to records_path
    end
    
    # 以下、複数登録用
    # @form = Form::RecordCollection.new(record_collection_params)
  #   if @form.save
  #     redirect_to records_path
  #   else
  #     redirect_to records_path
  #   end
  end

  def show 
    # @records = Record.all

    #今月の支出状況
    # 1,データベースから今月のレコードを取得
    @spending_month = Record.where('extract(year from recorded_at) = ? AND extract(month from recorded_at) = ?', Time.now.year, Time.now.month)
    # 2,カテゴリー名でグループ化して、金額を合計する。凡例をnameに置き換える。
    @spending_way_month = @spending_month.group("spending_way_id").sum(:price).sort_by { |_, v| v }.reverse.map { |k, v| [SpendingWay.find(k).name, v] }.to_h

    #月毎の支出状況
    @selected_year = Date.new(params[:year].to_i)
    # @selected_year = params[:year] || Date.today.year
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

  def record_params
    params
    .require(:record)
    .permit(:recorded_at, :spending_way_id, :spending_pay_id, :price, :description).merge(user_id: current_user.id)
  end

  # def record_collection_params
  #   params
  #   .require(:form_record_collection)
  #   .permit(records_attributes: [:recorded_at, :spending_way_id, :spending_pay_id, :price, :description, :user_id])
  #   .merge(user_id: current_user.id)
  # end

  def set_record
    @record = Record.find(params[:id])
  end

end
