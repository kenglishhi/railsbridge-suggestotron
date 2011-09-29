class VotesController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    topic.votes << Vote.create
    topic.save
    redirect_to topics_path
  end
end
