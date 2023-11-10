require 'rails_helper'

RSpec.describe 'Bachelorette Contestants Index Page', type: :feature do
  before :each do
    @bachelorette = Bachelorette.create!(name: "Danielle Smithson", season_number: 4, description: "Does Danny Find Love?")
    @contestant1 = @bachelorette.contestants.create!(name: "Harold", age: 20, hometown: "Houston")
    @contestant2 = @bachelorette.contestants.create!(name: "Paul", age: 24, hometown: "Plano")
    @contestant3 = @bachelorette.contestants.create!(name: "Jeremy", age: 21, hometown: "Tampa")
    @contestant4 = @bachelorette.contestants.create!(name: "Harold_v2", age: 21, hometown: "Houston")
  end

  # US 2
  it 'displays a bachelorette\'s contestants attributes and each name is a clickable link to their show page' do
    visit bachelorette_contestants_path(@bachelorette.id)

    @bachelorette.contestants.each do |contestant|
      within("#contestant-#{contestant.name}") do
        expect(page).to have_content("Name: #{contestant.name}")
        expect(page).to have_content("Age: #{contestant.age}")
        expect(page).to have_content("Hometown: #{contestant.hometown}")

        expect(page).to have_link("#{contestant.name}")
        click_link("#{contestant.name}")
        expect(current_path).to eq(contestant_path(contestant.id))
        visit bachelorette_contestants_path(@bachelorette.id)
      end
    end
  end

  # US 7
  it "displays a unique list of all contestant hometowns" do
    visit bachelorette_contestants_path(@bachelorette.id)

    expect(page).to have_content("These Contestants are from these hometowns: #{@contestant1.hometown}, #{@contestant2.hometown}, #{@contestant3.hometown}")
  end
end