class Bachelorette < ApplicationRecord
  has_many :contestants
  
  validates :name, :season_number, :description, presence: true
end
