module GravatarHelper
  def gravatar_image(options={})
    image_tag gravatar_image_url(Rails.application.secrets.gravatar_email, size: 200), options
  end
end
