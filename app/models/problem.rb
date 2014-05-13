class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :solutions  
  validates :name, presence: true
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
#  make_voteable
    
  default_scope -> { order('created_at DESC') }


  def self.unsolved_feed
    #unsolved_ids = "SELECT name FROM problems WHERE user_id > 0" 
    #where("(#{unsolved_ids})")
    Problem.all
  end
end
