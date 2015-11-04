require 'rails_helper'

feature 'User twitter feed' do
  fixtures :users

  let(:tweets) do
    [
      {id: 1, text: 'foo', user: {profile_image_url: 'http://placehold.it/100x100'}},
      {id: 2, text: 'bar', user: {profile_image_url: 'http://placehold.it/100x100'}}
    ]
  end

  before do
    allow_any_instance_of(Twitter::REST::Client).to receive(:home_timeline).and_return(tweets)
  end

  scenario 'shows users twitter feed', js: true do
    visit root_path
    click_link 'Sign in with twitter'
    expect(page).to have_content 'Twitter Live Feed'
    expect(page).to have_content 'foo'
    expect(page).to have_content 'bar'
  end
end
