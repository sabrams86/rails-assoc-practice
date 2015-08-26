class Contract < ActiveRecord::Base
  belongs_to :item
  belongs_to :owner, class_name :users
  belongs_to :renter, class_name :users
end
