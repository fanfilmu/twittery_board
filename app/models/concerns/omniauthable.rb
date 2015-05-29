module Omniauthable
  def from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |model|
      model.provider = auth.provider
      model.uid = auth.uid
    end
  end
end
