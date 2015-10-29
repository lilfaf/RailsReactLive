require 'rails_helper'

describe User do
	it { is_expected.to validate_presence_of(:uid) }
	it { is_expected.to validate_presence_of(:token) }
	it { is_expected.to validate_presence_of(:secret) }
end
