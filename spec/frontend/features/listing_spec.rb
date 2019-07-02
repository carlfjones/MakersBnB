feature "User can post a listing" do
  scenario "User creates a listing with Name, description and price per night" do
    visit ('/signup')
    fill_in 'email', with: "remy@hotmail.co.uk"
    fill_in 'username', with: "Remstar"
    fill_in 'password', with: "Password"
    click_button "Submit"
    visit ('/listings')
    fill_in 'name', with: "Party Mansion"
    fill_in 'description', with: "7 Hot tubs, 14 Bars, 3 pools and 34 bedrooms"
    fill_in 'price', with: 56
    click_button "Submit listing"
    expect(page).to have_content("Your listing has been posted")
  end
end
