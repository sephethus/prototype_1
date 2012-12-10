class Reply < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  belongs_to :conversation
  has_many :comments

  validates :user_id, presence: true
  validates :conversation_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
