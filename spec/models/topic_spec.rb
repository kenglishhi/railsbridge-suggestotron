require 'spec_helper'

describe Topic do
  context "validation" do
    it { should validate_presence_of(:title)}
  end
end
