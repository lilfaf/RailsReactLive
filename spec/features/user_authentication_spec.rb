require 'rails_helper'

feature 'User authentication' do
	fixtures :users

	let(:auth_hash) do
    {
			provider: 'twitter',
			uid: '123545',
			info: {
				name: 'Eric Cartman',
				image: 'http://placehold.it/100x100'
			},
			credentials: {token: 'XXX', secret: 'XXX'}
		}
	end

	before do
		OmniAuth.config.test_mode = true
		OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(auth_hash)
	end

	after do
	  OmniAuth.config.mock_auth[:twitter] = nil
	end

	scenario 'redirect user to login if unauthenticated' do
		visit root_path
		expect(page.current_path).to eq login_path
		expect(page).to have_content 'You must login with twitter'
	end

	scenario 'user sign in with twitter' do
		visit root_path
		click_link 'Sign in with twitter'
		expect(page.current_path).to eq root_path
		expect(page).to have_content 'Signed in successfully'
		expect(page).to have_content 'Signed in as Eric Cartman'
		expect(page).to have_content 'Sign out'
	end

	scenario 'user sign out' do
		page.set_rack_session(user_id: users(:foo).id)
		visit root_path
		click_link 'Sign out'
		expect(page.current_path).to eq login_path
		expect(page).to have_content 'Signed out successfully. Bye bye!'
	end
end
