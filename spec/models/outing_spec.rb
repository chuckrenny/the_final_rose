require 'rails_helper'

RSpec.describe Outing, type: :model do
  before :each do
    @bachelorette = Bachelorette.create!(name: "Danielle Smithson", season_number: 4, description: "Does Danny Find Love?")
    @contestant1 = @bachelorette.contestants.create!(name: "Harold", age: 20, hometown: "Houston")
    @contestant2 = @bachelorette.contestants.create!(name: "Jackie", age: 24, hometown: "LA")
    @contestant3 = @bachelorette.contestants.create!(name: "Aaron", age: 22, hometown: "NYC")

    @outing1 = Outing.create!(name: 'Helicopter Ride', location: 'Malibu', date: '06/23/23')
    @outing2 = Outing.create!(name: 'Hot_Springs', location: 'Palm Springs', date: '01/10/22')
    @outing3 = Outing.create!(name: 'Kickball', location: 'Los Angeles', date: '10/01/24')

    @contestant1_outing1 = ContestantOuting.create!(contestant: @contestant1, outing: @outing1)
    @contestant1_outing2 = ContestantOuting.create!(contestant: @contestant2, outing: @outing1)
    @contestant1_outing3 = ContestantOuting.create!(contestant: @contestant3, outing: @outing1)
  end

  describe "relationships" do
    it {should have_many(:contestant_outings)}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:date)}
  end

  describe "instance methods" do
    describe "#total_contestant_count" do
      it "returns the all contestants from an outing" do
        expect(@outing1.total_contestant_count).to eq(3)
      end
    end

    describe "#all_contestant_names" do
      it "returns all contestant names from an outing" do
        expect(@outing1.all_contestant_names).to eq(["#{@contestant1.name}", "#{@contestant2.name}", "#{@contestant3.name}"])
      end
    end
  end
end