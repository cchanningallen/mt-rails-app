class Post < ApplicationRecord
  include Votable

  validates_presence_of :title, :content

  has_many :comments
end
