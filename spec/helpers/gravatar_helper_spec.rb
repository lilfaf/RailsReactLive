require 'rails_helper'

describe GravatarHelper do

  before do
    ENV['GRAVATAR_EMAIL'] = 'example@email.com'
  end

  subject {Nokogiri::HTML(helper.gravatar_image(options)).at_css('img')}

  context 'with default size' do
    let(:options) {{}}
    it { expect(subject.attr('src')).to eq "http://gravatar.com/avatar/8693e24361d64d626c948e69237acc34?size=200" }
  end

  context 'with bigger size' do
    let(:options) {{size: 400}}
    it { expect(subject.attr('src')).to eq "http://gravatar.com/avatar/8693e24361d64d626c948e69237acc34?size=400" }
  end
end
