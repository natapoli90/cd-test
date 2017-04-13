class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email,
    presence: true,
    length: { minimum: 1, maximum: 20 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
    presence: true,
    format: { with: EMAIL_REGEX},
    uniqueness: { case_sensitive: false },
    length: { maximum: 20 }

  validates :password_digest, confirmation: true, length: { in: 6..20 }
  validates :confirm_password_digest, presence: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password_digest])
  end
end
