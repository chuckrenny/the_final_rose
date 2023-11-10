class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings
  
  validates :name, :location, :date, presence: true

  def total_contestant_count
    self.contestants.count()
  end

  def all_contestant_names
    self.contestants.pluck(:name)
  end
end