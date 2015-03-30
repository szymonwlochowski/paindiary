class Description < ActiveRecord::Base

  has_many :characteristics
  belongs_to :user

  validates :name, presence: true

  scope :own, ->(current_user) { where{(user_id.eq nil) | (user_id.eq current_user)} }

end
