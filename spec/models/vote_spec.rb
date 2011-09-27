require 'spec_helper'

describe Vote do
  context "associations" do
    it { should belong_to(:topic) }
  end
end
