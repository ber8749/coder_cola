class Address < ActiveRecord::Base
  SHIPPING = 'shipping'
  BILLING = 'billing'
  KINDS = [SHIPPING,BILLING]

  belongs_to :user

  validates :line1, :city, :state, :country, :postal_code, :kind, presence: true

  scope :shipping, -> { where(kind: SHIPPING) }
  scope :billing, -> { where(kind: BILLING) }
end
