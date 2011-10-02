require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the TopicsHelper. For example:
#
# describe TopicsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe TopicsHelper do
  describe "current_user_has_voted_on_topic(topic)" do
    it "should return false by default" do
      topic = topics(:first_topic)
      helper.stub(:current_user).and_return(User.new)
      helper.current_user_has_voted_on_topic(topic).should be_false
    end

    it "should return true if user has a vote" do
      topic = topics(:first_topic)
      helper.stub(:current_user).and_return(users(:first_user))
      helper.current_user_has_voted_on_topic(topic).should be_true
    end
  end
end
