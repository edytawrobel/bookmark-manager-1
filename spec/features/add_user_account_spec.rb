require 'spec_helper'

# Write a failing feature test that:
#  Visits a URL, sees a signup form, enters an email and password and submits the form.
#  Checks that, when the form is submitted, the browser is directed to the /links page.
#  Checks that the /links page shows a welcome message.
#  Checks that the user's email address is displayed as part of the welcome message.
#  Checks that the User count increases by 1.



feature 'Sign up for the account' do
  scenario 'I would like to submit the form' do
    visit ('/')

    fill_in(:email, with: 'amanda.clement@gmail.com')
    fill_in(:password, with: 'dog2013')
    click_button ('Submit')

    expect(page).to have_content('Welcome amanda.clement@gmail.com!')
    #expect { user_account }.to change{user_account.count}.by(1)
  end
end
