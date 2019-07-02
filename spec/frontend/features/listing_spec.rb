feature "User can post a listing" do
  scenario "User creates a listing with Name, description and price per night" do
    visit ('/listings')
    fill_in 'name', with: "Party Mansion"
    fill_in 'Description', with: "7 Hot tubs, 14 Bars, 3 pools and 34 bedrooms"
    fill_in 'Price per night', with: "56"
    click_button "Submit listing"
    expect(page).to have_content("You have listed:", "Party Mansion", "7 Hot tubs, 14 Bars, 3 pools and 34 bedrooms","£56")
  end
end
