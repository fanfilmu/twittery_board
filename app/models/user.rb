class User < ActiveRecord::Base
  extend Omniauthable
  # Include default devise modules. Others available are:
  # :database_authenticatable, :validatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :rememberable, :omniauthable, omniauth_providers: [:twitter]
end
