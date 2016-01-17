class Address < ActiveRecord::Base
  belongs_to :user

  validates :line1, :city, :state, :postal_code, presence: true
end
