class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.votes << Vote.create
    @topic.save
    respond_to do |format|
      format.html { redirect_to topics_path }
      format.json { render json: @topic }
    end


  end
end
