=begin
 Author: Jack
 Tag model
 
 id - integer PRIMARY KEY
 label - string
 
=end
class Tag < ActiveRecord::Base
  has_many :tag_instances
  
  validate :label, presence: true
  
  # Returns everything
  # Author: Jack 
  def self.getAll()
     find(:all)
     end
end
