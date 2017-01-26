require 'spec_helper'

# Write a failing feature test that:
#  Visits a URL, sees a signup form, enters an email and password and submits the form.
#  Checks that, when the form is submitted, the browser is directed to the /links page.
#  Checks that the /links page shows a welcome message.
#  Checks that the user's email address is displayed as part of the welcome message.
#  Checks that the User count increases by 1.



feature 'Sign up for the account' do
  scenario 'I would like to sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
       expect(page).to have_content('Welcome, tom@example.com')
       expect(User.first.email).to eq('tom@example.com')
    end
end
