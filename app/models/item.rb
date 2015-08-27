class Item < ActiveRecord::Base
  belongs_to :user
  has_many :categories, through: :categorizations

  CONDITIONS = ['New', 'Like New', 'Used', 'Old', 'Damaged', 'Fair']
end
