class User < ApplicationRecord
	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :FirstName,  presence: true
    validates :LastName, presence: true
    validates :email, presence: true,format: {with: VALID_EMAIL_REGEX},uniqueness: { case_sensitive: false }
    #validates :PhoneNumber, presence: true
    #validates :Password, presence: true,length: {within: 8..20}
    #validates :ConfirmPassword, presence: true
    validates :password, length: { minimum: 8 }
    has_secure_password
end
