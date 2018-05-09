# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string           not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: {message: 'Password cannot be blank'}
  validates :password, length: {minimum: 6, allow_nil: true}
  before_validation :ensure_session_token

  attr_reader :password

  def self.find_by_credentials
    u = BCrypt::Password.create(password)
    user = find_by(username: username)
    if user && BCrypt::Password.new(user.password_digest).is_password?(password)
      return user
    else
      return nil
    end
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

 def reset_session_token!
   self.session_token = User.generate_session_token
   self.save
   self.session_token
 end

 def ensure_session_token
   self.session_token ||= User.generate_session_token
 end



  def password= (password)
    self.password_digest = BCrypt::Password.create(password)
  end


end
