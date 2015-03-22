class Description < ActiveRecord::Base

  has_many :characteristics

  validates :name, presence: true, uniqueness: true

end
