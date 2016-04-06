class User < ActiveRecord::Base
  validates :username, presence: true, length: { maximum: 40 }, uniqueness: true
  validate :username, :is_lowercase

  validates :name, presence: true, length: { maximum: 40 }

  validate :password, :is_valid_password
  has_secure_password

  has_many :media_tags

  def to_s
    name.length < 16 ? name : name[0, 13].rstrip << '..'
  end

  def is_valid_password
    min_pass_length = 4
    if not password.nil?
      if password.length < min_pass_length
        errors.add(:password, "is too short (minimum is #{min_pass_length} characters)")
      elsif /[A-Z]/.match(password).nil? || /[0-9]/.match(password).nil?
        errors.add(:password, 'has to contain at least one number and uppercase character.')
      end
    end
  end

  def is_lowercase
    username.to_s == username.to_s.downcase
  end
end