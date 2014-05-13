class User < ActiveRecord::Base
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
         before_create :create_remember_token
  
         before_save { email.downcase! }
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  has_many :problems
  has_many :solutions
#  make_voter


  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end
  
  
  # def opinionated?(problem)
    # opinions.find_by(problem_id: problem.id)
  # end
# 
# 
  # def opinionate!(problem, updown)
    # opinions.create!(problem_id: problem.id, updown: updown)
  # end
# 

  
  
  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

end
