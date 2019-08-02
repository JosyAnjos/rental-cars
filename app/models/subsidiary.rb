class Subsidiary < ApplicationRecord
  has_one :address
  has_many :cars
  accepts_nested_attributes_for :address

  validates :name, presence: { message: 'Nome não pode ficar em branco' }
end
