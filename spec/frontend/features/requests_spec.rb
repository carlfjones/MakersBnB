feature 'user can view requests' do
  scenario 'view all requests in a request page' do
    visit ('/signup')
    fill_in 'email', with: "remy@hotmail.co.uk"
    fill_in 'username', with: "Remstar"
    fill_in 'password', with: "Password"
    click_button "Submit"
    click_link('add')
    fill_in 'name', with: "Party Mansion"
    fill_in 'description', with: "7 Hot tubs, 14 Bars, 3 pools and 34 bedrooms"
    fill_in 'price', with: 56
    click_button "Submit listing"
    # find_link('Party Mansion').click
    # click_on('Party Mansion')
    find_link("request").click
    expect(page).to have_content("Your Requests")
    expect(page).to have_css('div.requestsmade')
    expect(page).to have_css('div.requestsreceived')




  end
end
