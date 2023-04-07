class Form::RecordCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :records, :user_id

  def initialize(attributes = {})
    super attributes
    self.records = FORM_COUNT.times.map { Record.new() } unless self.records.present?
  end

  # records_attributesで送られてきたパラメーターをattributesという変数に代入
  def records_attributes=(attributes)
    self.records = attributes.map { |_, v| Record.new(v) }
  end

  def save
    Record.transaction do
      self.records.map(&:save!)
    end
      return true
    rescue => e
      return false
  end
end

