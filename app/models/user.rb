class User < ActiveRecord::Base
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,     presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}
  validates :email,    presence: true,
                       format: {with: VALID_EMAIL_REGEX}

end
