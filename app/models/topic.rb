class Topic < ActiveRecord::Base
  validates_presence_of :title
  has_many :votes
  def number_of_votes
    votes.count
  end
end
