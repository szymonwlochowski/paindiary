require 'csv'

class Post < ActiveRecord::Base

  belongs_to :user
  has_many :characteristics
  has_many :descriptions, through: :characteristics
  belongs_to :bodypart

  validates :time, presence: true
  validates :body, presence: true, length: { within: 4..10000000 }
  validates :title, presence: true
  validates :bodypart, presence: true
  validates :pain_level, presence: true

  scope :own, ->(current_user) { where{ user_id.eq current_user } }
  scope :range, ->(range) {
    case range
    when nil
    when "week"
      where{time.gteq 7.days.ago}
    when "month"
      where{time.gteq 1.month.ago}
    when "year"
      where{time.gteq 1.year.ago}
    end
  }

  comma do
    title
    body
    #user :email
    bodypart :name => 'Bodypart'
    time
    pain_level
    comments
    meds
    non_drugs
    descriptions 'Descriptions' do |d| d.map(&:name).join(', ') end
  end

  def self.total_grouped_by_day(start)
    posts = where(created_at: start.beginning_of_day..Time.zone.today)
    posts = posts.group('posts.id, date(created_at)')
    posts = posts.select("created_at, sum(pain_level) as total_amount")
    posts = posts.group_by{ |p| p.created_at.to_date }
  end

  def self.sum_of_description_by_day(start)
    posts = where(created_at: start.beginning_of_day..Time.zone.tomorrow)
    posts = posts.group("posts.id, pain_level, date(created_at)")
    posts = posts.select("id, pain_level, created_at, sum(pain_level) as total_amount")
    posts = posts.group_by{ |p| p.pain_level }
    posts.map do |pain_level, value|
      value.group_by { |p| p.created_at.to_date }
    end
  end

  def self.as_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
