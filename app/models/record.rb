class Record < ApplicationRecord
  validates :recorded_at, presence: true
  validates :spending_way_id, presence: true, numericality: { other_than: 1, message: "を選択してください。" }
  validates :spending_pay_id, presence: true, numericality: { other_than: 1, message: "を選択してください。" }
  validates :price, presence: true,numericality: { only_integer: true }


  belongs_to :user
 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :spending_way
  belongs_to_active_hash :spending_pay


  def self.search(search)
    if search != ""
      Record.where('recorded_at LIKE(?)', "%#{search}%")
    else
      Record.all
    end
  end

end
