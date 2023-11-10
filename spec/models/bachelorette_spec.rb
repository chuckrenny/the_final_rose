require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  before :each do
    @bachelorette = Bachelorette.create!(name: "Danielle Smithson", season_number: 4, description: "Does Danny Find Love?")
    @contestant1 = @bachelorette.contestants.create!(name: "Harold", age: 20, hometown: "Houston")
    @contestant2 = @bachelorette.contestants.create!(name: "Paul", age: 24, hometown: "Houston")
    @contestant3 = @bachelorette.contestants.create!(name: "Jeremy", age: 21, hometown: "Tampa")
  end

  describe "relationships" do
    it {should have_many :contestants}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:season_number)}
    it {should validate_presence_of(:description)}
  end

  describe "instance methods" do
    describe "#average_contestant_age" do
      it "returns the average age of contestants" do
        expect(@bachelorette.average_contestant_age.round(2)).to eq(21.67)
      end
    end

    describe "#contestants_hometowns" do
      it "returns a unique list of all contestant hometowns" do
        expect(@bachelorette.contestants_hometowns).to eq(["Houston", "Tampa"])
      end
    end
  end
end
