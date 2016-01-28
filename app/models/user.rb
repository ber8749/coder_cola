class User < ActiveRecord::Base
  has_many :addresses
  has_many :orders

  accepts_nested_attributes_for :addresses

  validates :first_name, :last_name, :role, presence: true
  validates_associated :addresses

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    [first_name, last_name].join(' ')
  end

  def admin?
    role == 'admin'
  end

  def shipping_address
    addresses.shipping.first
  end
end
