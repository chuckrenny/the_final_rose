require 'rails_helper'

RSpec.describe Bachelorette, type: :feature do
  before :each do
    @bachelorette = Bachelorette.create!(name: "Danielle Smithson", season_number: 4, description: "Does Danny Find Love?")
    @contestant1 = @bachelorette.contestants.create!(name: "Harold", age: 20, hometown: "Houston")
    @contestant2 = @bachelorette.contestants.create!(name: "Paul", age: 24, hometown: "Plano")
    @contestant3 = @bachelorette.contestants.create!(name: "Jeremy", age: 21, hometown: "Tampa")
  end

  # US 1
  it "displays the bachelorette show page and a link to the bachelorette's contestants" do
    visit bachelorette_path(@bachelorette.id)

    expect(page).to have_content("Danielle Smithson")
    expect(page).to have_content("Season #{@bachelorette.season_number} - #{@bachelorette.description}")

    expect(page).to have_link("Her Contestants")
    click_link("Her Contestants")

    expect(current_path).to eq(bachelorette_contestants_path(@bachelorette.id))

    expect(page).to have_content(@contestant1.name)
    expect(page).to have_content(@contestant2.name)
    expect(page).to have_content(@contestant3.name)
  end

  # US 6
  it "displays the average age of all bachelorette's contestants" do
    visit bachelorette_path(@bachelorette.id)

    expect(page).to have_content("Average Age of Contestants: 21.67")
  end
end