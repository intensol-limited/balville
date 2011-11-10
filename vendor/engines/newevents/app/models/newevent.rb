class Newevent < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text1, :text2]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :photo, :class_name => 'Image'
end
