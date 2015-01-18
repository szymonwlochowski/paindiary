class Post < ActiveRecord::Base

  belongs_to :user
  has_many :descriptions

  validates :body, presence: true, length: { within: 10..10000000 }
  validates :title, presence: true, uniqueness: true

  scope :range, ->(range) {
    case range
    when nil
    when "week"
      where{created_at.gteq 7.days.ago}
    when "month"
      where{created_at.gteq 1.month.ago}
    when "year"
      where{created_at.gteq 1.year.ago}
    end
  }
end
