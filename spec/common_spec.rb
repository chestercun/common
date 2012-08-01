require 'spec_helper'

describe "string extensions" do
  describe "palindrome feature" do
    subject { "racecar" }
    it { should be_palindrome }
  end
end

