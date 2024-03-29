class User < ApplicationRecord
  include Authenticable
  include TokenProcessor

  validates :email, presence: true, email: true
  validate :validate_password_presence
  validate :validate_password_length

  # after_destroy :destroy_token

  has_one :feedbacks_created, foreign_key: :nansiback_id, class_name: 'Feedback'
  has_many :feedbacks_received, foreign_key: :nasiback_id, class_name: 'Feedback'
  has_many :comments_created, foreign_key: :user_id, class_name: 'Comment'
  #
  # Finds a user given email and password
  # note: valid password method is inside authenticable
  #
  def self.find_by_credentials(creds)
    user = self.find_by(email: creds[:email])
    user if user.present? && user.valid_password?(creds[:password])
  end


end
