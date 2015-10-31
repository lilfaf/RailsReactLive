require 'rails_helper'

feature 'User twitter feed' do
	fixtures :users

	let(:tweets) do
    [{id: 1, text: 'foo'}, {id: 2, text: 'bar'}]
	end

	before do
		allow_any_instance_of(TweetsController).to receive(:tweets).and_return(tweets)
	end

	scenario 'shows users twitter feed', js: true do
		visit login_path
		click_link 'Sign in with twitter'
		expect(page).to have_content 'foo'
		expect(page).to have_content 'bar'
	end
end
