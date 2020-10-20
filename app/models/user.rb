class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  before_save :lowercase_and_strip

  def lowercase_and_strip 
    self.email.downcase! 
    self.email.strip
  end

  def authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase)
    if(@user && @user.authenticate(password))
      @user
    else
      nil
    end
  end
end
