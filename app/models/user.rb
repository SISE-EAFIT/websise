class User < ActiveRecord::Base
  # Fields
  # t.string :name
  # t.string :username
  # t.string :email
  # t.string :password
  # t.string :salt
  # t.date :birthday
  ####

  validates :name, presence: true
  validates :username, presence: true
  validates :email,
    presence: true,
    format: {
      with: /[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}/
    }

  before_save :encrypt_password

  def self.encrypt(password, salt)
    Digest::SHA2.hexdigest(">>pass::#{password}<<salt::#{salt};*")
  end

  def self.salt()
    Digest::SHA2.hexdigest("#{SecureRandom.uuid}>>SISE")
  end

  protected
  def encrypt_password
    if self.new_record?
      self.salt = User.salt()
      self.password = User.encrypt(self.password, self.salt)
    end
  end
end
