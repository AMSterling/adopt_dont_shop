class Application < ApplicationRecord
  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, numericality: true, length: { is: 5 }
  validate :applicant_bio
  validate :application_status
  has_many :application_pets, dependent: :destroy
  has_many :pets, through: :application_pets
end
