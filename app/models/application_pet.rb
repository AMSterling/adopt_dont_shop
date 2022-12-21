class ApplicationPet < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  after_initialize :default, unless: :persisted?

  def default
    self.approved = nil
  end
end
