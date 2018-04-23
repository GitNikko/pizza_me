class Restaurant < ApplicationRecord
  # Dependent: :destroy will destroy the dependent reviews if the restaurant is deleted.
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :yelp_id, presence: true
  
  
end
