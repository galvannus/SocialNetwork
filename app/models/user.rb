class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	validates :username, presence: true, uniqueness: true

	validate :validate_username_regex

	#Relations
	has_many :posts

	private
		#verify username 
		def validate_username_regex
			unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
	 			errors.add(:username, "El username debe iniciar con una letra")
	 			errors.add(:username, "El username sólo puede tener _,letras")
 			end
		end
	
end
