module GravatarHelper
  def gravatar_image(options={})
    size = options.delete(:size) || 200
    hash = Digest::MD5.hexdigest(Rails.application.secrets.gravatar_email)

    image_tag "http://gravatar.com/avatar/#{hash}?size=#{size}", options
  end
end
