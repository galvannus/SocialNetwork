class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	validates :username, presence: true, uniqueness: true

	validate :validate_username_regex

	#Relations
	has_many :posts

	has_attached_file :avatar, styles: { medium: "300x300", thumb: "100x100"}, default_url: "/images/:style/missing.jpg"
	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

	has_attached_file :cover, styles: {medium: "800x600", thumb: "400x300"}, default_url: "/images/:style/missing_cover.jpg"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	private
		#verify username 
		def validate_username_regex
			unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
	 			errors.add(:username, "El username debe iniciar con una letra")
	 			errors.add(:username, "El username sólo puede tener _,letras")
 			end
		end
	
end
