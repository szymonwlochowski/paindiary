class Description < ActiveRecord::Base

  belongs_to :post

  validates :name, presence: true, uniqueness: true

end
