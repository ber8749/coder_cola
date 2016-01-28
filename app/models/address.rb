class Address < ActiveRecord::Base
  SHIPPING = 'shipping'.freeze
  BILLING = 'billing'.freeze
  KINDS = [SHIPPING, BILLING].freeze

  belongs_to :user

  validates :line1, :city, :state, :country, :postal_code, :kind, presence: true

  scope :shipping, -> { where(kind: SHIPPING) }
  scope :billing, -> { where(kind: BILLING) }
end
