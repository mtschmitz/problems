class Problem < ActiveRecord::Base
  belongs_to :user
#  has_many :solutions  
  validates :name, presence: true
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 2000 }
  default_scope -> { order('created_at DESC') }

end
