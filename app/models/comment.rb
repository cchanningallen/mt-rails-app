class Comment < ApplicationRecord
  include Votable

  validates_presence_of :content

  belongs_to :post
end
