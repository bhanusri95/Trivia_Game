class User < ApplicationRecord
    has_many :trivia, dependent: :destroy
	before_save { self.email = email.downcase }
    before_create :create_remember_token
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :FirstName,  presence: true
    validates :LastName, presence: true
    validates :email, presence: true,format: {with: VALID_EMAIL_REGEX},uniqueness: { case_sensitive: false }
    #validates :PhoneNumber, presence: true
    #validates :Password, presence: true,length: {within: 8..20}
    #validates :ConfirmPassword, presence: true
    validates :password, length: { minimum: 8 }
    has_secure_password
    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.digest(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

    def create_remember_token
        self.remember_token = User.digest(User.new_remember_token)
    end

end
