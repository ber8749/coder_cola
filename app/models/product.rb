class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, through: :line_items

  validates :description, :name, :price, presence: true

  def shipped
    orders.shipped.map { |o| o.line_items.sum(:quantity) }.sum
  end

  def sold
    line_items.sum(:quantity)
  end
end
