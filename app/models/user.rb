class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness:  { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }


# this works because we use the convention names for attributes in our tests
# and in the creation of a user.
# it brings in password and password_confirmation attributes but doesn't call
# them out here.

# comment out to get authenticate tests to fail before getting them to pass.
validates :password, length: { minimum: 6 }
has_secure_password

end
