feature "User can sign up to Makers Bnb" do
  scenario "User signs up to Makers Bnb" do
    visit ('/signup')
    fill_in 'name', with: "Remmmmmmmmmmmmmstar"
    fill_in 'email', with: "remy@hotmail.co.uk"
    fill_in 'username', with: "Remstar"
    fill_in 'password', with: "Password"
    click_button "Submit"

    expect(page).to have_content("logged in as: Remstar")
  end
end
