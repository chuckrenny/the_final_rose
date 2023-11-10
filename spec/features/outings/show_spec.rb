require 'rails_helper'

RSpec.describe "Outing Show Page", type: :feature do
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

  # US 4
  it "displays outings attributes, total contestants at the outing, and the names of all contestants at the outing" do
    visit outing_path(@outing1.id)

    expect(page).to have_content("#{@outing1.name}")
    expect(page).to have_content("Location: #{@outing1.location}")
    expect(page).to have_content("Date: #{@outing1.date}")
    expect(page).to have_content("Total Contestants: #{@outing1.total_contestant_count}")
    expect(page).to have_content("Contestant Names: #{@contestant1.name}, #{@contestant2.name}, #{@contestant3.name}")
  end
end