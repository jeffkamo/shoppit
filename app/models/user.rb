class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :items
  has_many :comments
  has_many :votes
  has_many :voted_items, :through => :votes, :source => 'item'

  def has_voted?(item)
    voted_items.include?(item)
  end

  def vote_from(item)
    votes.where(:item_id => item.id).first
  end

  def is_vote_up?(item)
    vote_from(item).is_vote_up
  end
end
