require 'rails_helper'

RSpec.describe Contestant, type: :feature do
  before :each do
    @bachelorette = Bachelorette.create!(name: "Danielle Smithson", season_number: 4, description: "Does Danny Find Love?")
    @contestant1 = @bachelorette.contestants.create!(name: "Harold", age: 20, hometown: "Houston")

    @outing1 = Outing.create!(name: 'Kickball', location: 'Los Angeles', date: '06/23/23')
    @outing2 = Outing.create!(name: 'Hot_Springs', location: 'Palm Springs', date: '01/10/22')
    @outing3 = Outing.create!(name: 'Helicopter_Ride', location: 'Malibu', date: '10/01/24')

    @contestant1_outing1 = ContestantOuting.create!(contestant: @contestant1, outing: @outing1)
    @contestant1_outing2 = ContestantOuting.create!(contestant: @contestant1, outing: @outing2)
    @contestant1_outing3 = ContestantOuting.create!(contestant: @contestant1, outing: @outing3)
  end

  # US 3
  it "displays the contestants name, season number/description and list of outing links for the contestant" do
    visit contestant_path(@contestant1.id)

    expect(page).to have_content("#{@contestant1.name} Show Page")
    expect(page).to have_content("Season #{@contestant1.bachelorette.season_number} - #{@contestant1.bachelorette.description}")

    @contestant1.outings.each do |outing| 
      within("#outing-#{outing.name}") do
        expect(page).to have_link("#{outing.name}")
        click_link("#{outing.name}")
        expect(current_path).to eq(outing_path(outing.id))
        visit contestant_path(@contestant1.id)
      end
    end
  end
end