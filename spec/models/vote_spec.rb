require 'spec_helper'

describe Vote do
  context "associations" do
    it { should belong_to(:topic) }
    it { should belong_to(:user) }
  end
  context "validations" do
    it { should validate_uniqueness_of(:user_id).scoped_to(:topic_id) }
    it { should validate_presence_of(:user_id) }
  end
end
