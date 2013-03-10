class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :profile_name, presence: true,
            uniqueness: true,
            format: {
            	with: /^[a-zA-Z0-9]+$/,
            	message: 'Profile name must only contain numbers and letters'
            }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def full_name
  	first_name + " " + last_name
  end

  def gravatar_url
  	stripped_email = email.strip
  	"http://gravatar.com/avatar/#{"+ Digest::MD5.hexdigest(stripped_email.downcase) +"}?d=retro"
  end

end
