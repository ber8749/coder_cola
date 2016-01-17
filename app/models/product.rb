class Product < ActiveRecord::Base
  has_many :line_items

  validates :description, :name, :price, presence: true

  def total_sold
    line_items.map(&:quantity).sum
  end
end
