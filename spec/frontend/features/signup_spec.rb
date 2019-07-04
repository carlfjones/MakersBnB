feature "Sign up link takes user to sign up page" do
  scenario "user clicks on sign up link and visits sign up page" do
    visit ('/')
    click_link "Sign up"
    expect(page).to have_content("Sign Up")
  end
end

feature "User can sign up to Makers Bnb" do
  scenario "User signs up to Makers Bnb" do
    visit ('/signup')
    fill_in 'email', with: "remy@hotmail.co.uk"
    fill_in 'username', with: "Remstar"
    fill_in 'password', with: "Password"
    click_button "Submit"

    expect(page).to have_content("All Available Listings for Remstar")
  end
end
