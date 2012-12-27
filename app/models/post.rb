class Post < ActiveRecord::Base
  attr_accessible :text, :title

  validates :text, :presence => true, :length => {:minimum => 5, :maximum => 140}
  validates :title, :presence => true, :length => {:minimum => 5, :maximum => 30}
end
