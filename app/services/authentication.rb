module Authentication
  def self.user_from_auth_hash(hash)
    User.where(provider: hash.provider, uid: hash.uid).first_or_create.tap do |u|
      u.name   = hash.info.name
      u.image  = hash.info.image
      u.token  = hash.credentials.token
      u.secret = hash.credentials.secret
      u.save
    end
  end
end
