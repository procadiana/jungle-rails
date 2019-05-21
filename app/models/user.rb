class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :name, presence: true
  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, :length => {:minimum => 6 }


  def self.authenticate_with_credentials (email, password)
    eml = email.strip.downcase
    user = User.find_by_email(eml)
    user && user.authenticate(password)? user : nil
  end

end
