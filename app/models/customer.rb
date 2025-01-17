class Customer < ApplicationRecord
  has_many :rentals
  validates :name, :email, :cpf, :phone, presence: true

  def cpf_name
    "#{cpf} - #{name}"
  end

  def rental?
    rentals.where(rentals: { finished_at: nil }).count > 0
  end
end
