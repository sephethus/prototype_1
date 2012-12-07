class Conversation < ActiveRecord::Base
  attr_accessible :subject, :content
  belongs_to :user
  has_many :replies

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 3000 }
  validates :subject, presence: true, length: { maximum: 80 }
  
end
