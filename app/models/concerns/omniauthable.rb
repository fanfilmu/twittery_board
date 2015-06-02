module Omniauthable
  def from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |model|
      model.provider = auth.provider
      model.uid      = auth.uid
      model.secret   = auth.credentials.secret
      model.token    = auth.credentials.token
    end
  end
end
