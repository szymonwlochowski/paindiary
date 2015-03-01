class Characteristic < ActiveRecord::Base

  belongs_to :post
  belongs_to :description

end
