class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name, :url
  validates :name, :presence => true
  validates :cost, :presence => true
  validates :url, :presence => true

  has_many :comments
end
