class Order < ActiveRecord::Base
  PENDING = 'pending'
  SHIPPED = 'shipped'
  STATUSES = [PENDING,SHIPPED]

  belongs_to :user
  has_many :line_items, dependent: :destroy

  accepts_nested_attributes_for :line_items

  validates :status, presence: true
  validates_associated :line_items

  scope :pending, -> { where(status: PENDING) }
  scope :shipped, -> { where(status: SHIPPED) }
end
