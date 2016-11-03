require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "Associations" do
    it { should belong_to(:votable) }
  end
end
