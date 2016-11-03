require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:content) }
  end

  describe "Associations" do
    it { should belong_to(:post) }
    it { should have_many(:votes) }
  end

  # TODO: refactor this into a shared_example file
  # TODO: refactor this to use FactoryGirl
  describe "Votable" do
    let(:post) { Post.create({title: "Title", content: "Content"}) }
    let(:comment) { post.comments.create({content: "Content"}) }

    it "upvotes" do
      comment.upvote!
      expect(comment.votes.first.vote_type).to eq("upvote")
    end

    it "downvotes" do
      comment.downvote!
      expect(comment.votes.first.vote_type).to eq("downvote")
    end
  end
end
