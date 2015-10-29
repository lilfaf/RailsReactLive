require 'rails_helper'

feature 'User twitter feed', js: true do
	fixtures :users

	let(:tweets) do
    [
			{id: 1, text: 'foo'},
			{id: 2, text: 'bar'}
		]
	end

	before do
    page.set_rack_session(user_id: users(:foo).id)

		allow_any_instance_of(FeedController).to receive(:tweets).and_return(tweets)
	end

	scenario 'shows users twitter feed' do
		visit root_path
		expect(page).to have_content 'foo'
		expect(page).to have_content 'bar'
	end
end
