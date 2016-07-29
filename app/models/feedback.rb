class Feedback < ApplicationRecord
  belongs_to :nasiback, class_name: 'User'
  belongs_to :nansiback, class_name: 'User'
end
