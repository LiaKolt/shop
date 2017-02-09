class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true

  has_many :order_items
  before_destroy :not_referenced_by_any_order_item
  # убеждаемся в отсутствии товарных позиций, ссылающихся на данный товар
  def not_referenced_by_any_order_item
    if order_items.empty?
      return true
    else
      errors.add(:base, 'существуют товарные позиции')
      return false
    end
  end
end
