class Form::RecordCollection < Form::Base
  FORM_COUNT = 3
  attr_accessor :records
  attr_accessor :user_id

  def initialize(attributes = {})
    super attributes
    self.records = FORM_COUNT.times.map { Record.new() } unless self.records.present?
  end

  # records_attributesで送られてきたパラメーターをattributesという変数に代入
  def records_attributes=(attributes)
    self.records = attributes.map { |_, v| Record.new(v) }
  end

#   def records_attributes=(attributes)
#     self.records = attributes.map do |_, v|
#     r = Record.new(v)
#     r.user_id = user_id # user_idを設定する
#     r
#   end
# end


  def save
    Record.transaction do
      self.records.map(&:save!)
    end
      return true
    rescue => e
      return false
  end


end

