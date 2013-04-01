class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name, :url

  validates_presence_of :name, :cost, :url

  has_many :comments
  belongs_to :user
  has_many :votes
  has_many :users, :through => :votes

  def tally_votes
    count = 0

    votes.each do |vote|
      if vote.is_vote_up?
        puts 1
        count += 1
      else
        puts -1
        count -= 1
      end
    end

    count
  end
end
