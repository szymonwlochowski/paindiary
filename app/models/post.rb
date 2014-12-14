class Post < ActiveRecord::Base

  belongs_to :user
  has_many :descriptions

  validates :body, presence: true, length: { within: 10..10000000 }
  validates :title, presence: true, uniqueness: true
end
