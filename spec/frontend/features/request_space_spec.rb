feature 'user can request a space' do
  scenario 'view list, pick a space, request' do
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
    find_link("Party Mansion").click
    find_button("REQUEST").click
    expect(page).to have_content("Thanks, Remstar, we got your request to book Party Mansion")
    expect(page).to have_css('span.navigation')
    expect(page).to have_css('div#eagle')
    expect(page).to have_content("Add a new space")
    expect(page).to have_content("Back to list")
  end
end
