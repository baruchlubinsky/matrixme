require 'digest/sha1'

class User
	include Mongoid::Document
	
	field :name, :type => String
	field :email, :type => String
	field :salt, :type => String
	index :email, :unique => true
	field :password, :type => String 

	validates_uniqueness_of :email
	validates_format_of :email, :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	has_many :matrix_objects
	has_many :workspaces
	
  def hash_password(pw)
    salt ||= Digest::SHA1.hexdigest(Time.now.to_s)
    Digest::SHA2.hexdigest(pw + salt)
  end
    
	def password=(val)
	  self.write_attribute(:password, hash_password(val))
	end
	
	def password_match?(pw)
	  self.hash_password(pw) == password
	end
	
	
end
