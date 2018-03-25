class User < ApplicationRecord
  # Dependent: :destroy will destroy the dependent reviews if the user is deleted.
  has_many :reviews, dependent: :destroy
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  # 'allow_nil: true' allows our edit form to only edit certain attributes while leaving the password
  # field blank. Blank passwords for new users is still caught by the has_secure_password presence validation.
  # This also conveniently fixes a duplicate 'blank password' error message.  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :profile_image, presence: true
  
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
    
  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end 
  
  # Returns true if the given token matches the digest.
  # This method has been refactored to be used by the session, activation and reset controllers.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  # Retrieves or creates a user from the auth hash attributes
  def self.find_or_create_by_omniauth(auth)
      oauth_email = auth["info"]["email"]
      oauth_name = auth["info"]["name"]
      oauth_image = auth["info"]["image"]
      self.where(:email => oauth_email, :name => oauth_name).first_or_create do |user|
        user.password = SecureRandom.hex 
        user.profile_image = oauth_image
        user.activated = true
        user.oauth_login = true
      end
  end
  
  #Activates an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end
  
  # Sends activation email
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end
  
  #Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_columns(reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now)
  end
  
  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  
  # Returns true if a password reset has expired
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  private
    # Converts email to all lower-case
    def downcase_email
      self.email = email.downcase
    end
    # Creates and assigns the activation token and digest
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
  
end
