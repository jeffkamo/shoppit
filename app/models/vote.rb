class Vote < ActiveRecord::Base
  attr_accessible :is_vote_up, :item_id, :user_id

  belongs_to :user
  belongs_to :item

  def is_vote_up?
    is_vote_up
  end
end
