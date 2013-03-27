class Comment < ActiveRecord::Base
  attr_accessible :dialogue

  belongs_to :user
  belongs_to :item
end
