require "capybara/rspec"
require_relative "../../app.rb"
require "date"

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

feature "tell user happy birthday if it's their birthday" do
  scenario "show pleasant birthday greeting after user enters today's date" do
    visit("/")
    fill_in('day', with: Date.today.day)
    fill_in('month', with: Date.today.month)
    click_button "Submit"
    expect(page).to have_content(/It's today! Many happy returns!/)
  end

  scenario "tell user how many days they have to wait for their birthday" do
    visit("/")
    fill_in('day', with: Date.next_day(30).day)
    fill_in('month', with: Date.next_day(30).month)
    click_button "Submit"
    expect(page).to have_content(/Only 30 days to go!/)
  end
end