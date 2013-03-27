class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name, :url

  validates_presence_of :name, :cost, :url

  has_many :comments
  belongs_to :user
end
