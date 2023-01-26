class Simulation < ApplicationRecord
  validates :email, :phone_number, :first_name, :last_name, :address, presence: true
end
