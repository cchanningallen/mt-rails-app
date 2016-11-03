class Vote < ApplicationRecord
  enum vote_type: [:upvote, :downvote]

  validates :vote_type, presence: true

  belongs_to :votable, polymorphic: true
end
