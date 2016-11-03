module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable
  end

  def upvote!
    votes.create(vote_type: "upvote")
  end

  def downvote!
    votes.create(vote_type: "downvote")
  end
end
