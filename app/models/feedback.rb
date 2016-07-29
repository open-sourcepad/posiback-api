class Feedback < ApplicationRecord
  has_one :nasiback, class_name: 'User'
  belongs_to :nansiback, class_name: 'User'
end
