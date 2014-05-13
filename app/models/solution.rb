class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  validates :name, presence: true
  validates :user_id, presence: true
  validates :problem_id, presence: true
  validates :plan, presence: true, length: { maximum: 2000 }
  validates :result, length: {maximum: 2000}
end
