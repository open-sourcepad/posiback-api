class Feedback < ApplicationRecord
  belongs_to :nasiback, class_name: 'User'
  belongs_to :nansiback, class_name: 'User'
  has_many :comments_received, foreign_key: :comment_id, class_name: 'Comment'

  scope :positive, -> { where(category: '1') }
  scope :negative, -> { where(category: '2') }
end
