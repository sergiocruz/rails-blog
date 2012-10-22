class Posts < ActiveRecord::Base

  #fields
  attr_accessible :author_id, :blog, :title

  # Validates on save
  validates_presence_of :title, :blog

  # Relationship with author
  belongs_to :author

end
