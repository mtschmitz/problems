class Opinion < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :problem
  validates :user_id, presence: true
  validates :problem_id, presence: true
end
