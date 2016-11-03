require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end

  describe "Associations" do
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end

  # TODO: refactor this into a shared_example file
  # TODO: refactor this to use FactoryGirl
  describe "Votable" do
    let(:post) { Post.create({title: "Title", content: "Content"}) }

    it "upvotes" do
      post.upvote!
      expect(post.votes.first.vote_type).to eq("upvote")
    end

    it "downvotes" do
      post.downvote!
      expect(post.votes.first.vote_type).to eq("downvote")
    end
  end
end
