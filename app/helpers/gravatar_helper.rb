module GravatarHelper
  def gravatar_image(options={})
    image_tag gravatar_image_url(ENV['GRAVATAR_EMAIL'], size: 200), options
  end
end
