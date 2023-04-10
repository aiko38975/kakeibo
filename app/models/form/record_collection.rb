class Form::RecordCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :records, :user_id

  def initialize(attributes = {})
    super attributes
    self.user_id = attributes[:user_id] #追加
    self.records = FORM_COUNT.times.map { Record.new() } unless self.records.present?
  end

  # records_attributesで送られてきたパラメーターをattributesという変数に代入
  def records_attributes=(attributes)
    self.records = attributes.map { |_, v| Record.new(v.merge(user_id: user_id)) }
  end

  def save
    Record.transaction do
      self.records.map(&:save!)
    end
      return true
    rescue => e
  #以下３行はログ表示
  Rails.logger.error(e.message)
  Rails.logger.error(e.backtrace.join("\n"))
  self.errors.add(:base, '保存に失敗しました')
    return false
        return false
  end


end

