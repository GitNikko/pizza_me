class Restaurant < ApplicationRecord
  # Dependent: :destroy will destroy the dependent reviews if the restaurant is deleted.
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }
  
  
  
end
