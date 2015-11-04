require 'rails_helper'

feature 'User authentication' do
  fixtures :users

  scenario 'user sign in with twitter' do
    visit root_path
    click_link 'Sign in with twitter'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Signed in successfully'
    expect(page).to have_content 'Signed in as Eric Cartman'
    expect(page).to have_content 'Sign out'
  end

  scenario 'user sign out' do
    visit root_path
    click_link 'Sign in with twitter'
    click_link 'Sign out'
    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Signed out successfully. Bye bye!'
  end
end
