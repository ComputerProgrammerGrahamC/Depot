require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :name, :hashed_password, :salt

  validates :name, :presence => true, :uniqueness => true

  validates :password, :confirmation => true
  attr_accessor :password_confirmation
  attr_reader   :password

  validate :password_must_be_present

  def User.authenticate(name, password)
    puts "ENTER"
  	if user = find_by_name(name)
  		puts "found user"
      puts password
      puts user.hashed_password
      if user.hashed_password == password
  			puts "authenticated"
        user
  		end 
  	end
  end

  def User.encrypt_password(password, salt)
    puts "Checking Password"
  	Digest::SHA2.hexdigest(password + "wibble" + salt)
    puts Digest::SHA2.hexdigest(password + "wibble" + salt)
  end

  def password=(password)
  	@password = password

  	if password.present?
  		generate_salt
  		self.hashed_password = self.class.encrypt_password(password, salt)
 	end
  end

  private

  after_destroy :ensure_an_admin_remains

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end

  def password_must_be_present
  	errors.add(:password, "Missing password") unless hashed_password.present?
  end

  def generate_salt
  	self.salt = self.object_id.to_s + rand.to_s
  end  
end
