class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  belongs_to :reply

  validates :user_id, presence: true
  validates :reply_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
