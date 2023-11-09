require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:season_number)}
    it {should validate_presence_of(:description)}
  end
end
