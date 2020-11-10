require "capybara/rspec"
require_relative "../../app.rb"

Capybara.app = DaysUntilBirthdayApp

feature "show basic web app" do
  scenario "show the form with submit buttom prompting for users dob" do
    visit("/")
    expect(find_field('day'))
    expect(find_field('month'))
    expect(page).to have_content('Welcome to the Birthday Countdown!')
    expect(page).to have_button('Submit')
  end
end