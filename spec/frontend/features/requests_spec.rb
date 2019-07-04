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
    # another user creates another listing
    visit ('/signup')
    fill_in 'email', with: "bizarroremy@hotmail.co.uk"
    fill_in 'username', with: "BizarroRemstar"
    fill_in 'password', with: "Password"
    click_button "Submit"
    click_link('add')
    fill_in 'name', with: "NoParty Mansion"
    fill_in 'description', with: "No Hot tubs, 44 Bars, 1 bedroom"
    fill_in 'price', with: 65
    click_button "Submit listing"
    # log in as Remstar to request both mansions
    visit ('/sessions')
    fill_in 'username', with: "Remstar"
    fill_in 'password', with: "Password"
    click_button "Submit"
    find_link("Party Mansion").click
    find_button("REQUEST").click
    find_link("Look again at the listings").click
    find_link("NoParty Mansion").click
    find_button("REQUEST").click
    find_link("Look again at the listings").click
    click_link('request')
    expect(page).to have_content("Your Requests")
    expect(page).to have_css('div.requestsmade')
    expect(page).to have_content("Requests You Have Received:")
    expect(page).to have_css('div.requestsreceived')
    expect(page).to have_content("Requests You Have Made:")
    expect(page).to have_content("Party Mansion")
    expect(page).to have_content("NoParty Mansion")
    expect(page).to have_content("Remstar")
    expect(page).to have_content("BizarroRemstar")
  end
end
