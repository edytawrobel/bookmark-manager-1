require 'spec_helper'

# Write a failing feature test that:
#  Visits a URL, sees a signup form, enters an email and password and submits the form.
#  Checks that, when the form is submitted, the browser is directed to the /links page.
#  Checks that the /links page shows a welcome message.
#  Checks that the user's email address is displayed as part of the welcome message.
#  Checks that the User count increases by 1.

# feature 'Sign up for the account' do
#   scenario 'I would like to sign up as a new user' do
#     expect { sign_up }.to change(User, :count).by(1)
#        expect(page).to have_content('Welcome, tom@example.com')
#        expect(User.first.email).to eq('tom@example.com')
#     end
# end

 # Fills in an email and password into the user signup form.
 # Fills in a mismatching confirmation password into the user signup form.
 # Checks that when the form is submitted, no new users are created.
 feature 'User sign up' do

   scenario 'requires a matching confirmation password' do
     expect { sign_up(password_confirmation: 'dogs11') }.not_to change(User, :count)
     expect(current_path).to eq('/users')
     expect(page).to have_content 'Please enter your password again'
   end

   def sign_up(email: 'tom@example.com',
               password: 'dogs10',
               password_confirmation: 'dogs10')
     visit '/users/new'
     fill_in :email, with: email
     fill_in :password, with: password
     fill_in :password_confirmation, with: password_confirmation
     click_button 'Sign up'
   end

 end
