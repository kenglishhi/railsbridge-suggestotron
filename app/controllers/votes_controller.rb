class VotesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.votes << Vote.create(:user => current_user)
    respond_to do |format|
      format.html { redirect_to topics_path }
      format.json { render :json => @topic.to_json(:methods => :number_of_votes) }
    end
  end
end
