class Bachelorette < ApplicationRecord
  has_many :contestants
  
  validates :name, :season_number, :description, presence: true

  def average_contestant_age
    self.contestants.average(:age)
  end

  def contestants_hometowns
    self.contestants.pluck(:hometown).uniq
  end
end
