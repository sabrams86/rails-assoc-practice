class Item < ActiveRecord::Base
  belongs_to :user
  has_many :categories, through: :categorizations
end
