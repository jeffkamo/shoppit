class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name, :url
end
