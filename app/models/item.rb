class Item < ActiveRecord::Base
  attr_accessible :cost, :description, :name, :url, :image

  validates_presence_of :name, :cost, :url

  has_many :comments
  belongs_to :user
  has_many :votes
  has_many :users, :through => :votes

  has_attached_file :image,
    :styles => { :medium  => "300x300>",
                 :thumb   => "100x100>" },
    :default_url => "/assets/missing.png"

  attr_accessor :image_file_name
  attr_accessor :image_content_type
  attr_accessor :image_file_size
  attr_accessor :image_updated_at

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
