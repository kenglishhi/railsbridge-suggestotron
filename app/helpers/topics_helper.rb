module TopicsHelper
  def current_user_has_voted_on_topic(topic)
   ! current_user.votes.where(:topic_id => topic.id).empty?
  end
end
