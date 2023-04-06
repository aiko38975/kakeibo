class SpendingWay < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '食費' },
    { id: 3, name: '生活費' },
    { id: 4, name: '医療費' },
    { id: 5, name: '衣類' }
  ]

  include ActiveHash::Associations
  has_many :records
end
