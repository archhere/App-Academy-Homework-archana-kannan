# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email_address   :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#

class User < ApplicationRecord
  validates :session_token, presence: true
  validates :email_address , presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end


  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end


  def reset_session_token
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password= (input_password)
    @password = input_password
    self.password_digest = BCrypt::Password.create(input_password)
  end

  def is_password?(input_password)
    BCrypt::Password.new(self.password_digest).is_password?(input_password)
  end

  def self.find_by_credentials(email_address,password)
    user = User.find_by(email_address: email_address)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end





end
