class Vote < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates_uniqueness_of :user_id, :scope => :topic_id
  validates_presence_of :user_id
end
