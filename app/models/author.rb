class Author < ActiveRecord::Base
  attr_accessible :name

  # One to many relationship with posts
  has_many :posts
end
