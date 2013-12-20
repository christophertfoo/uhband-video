=begin
 Author: Jack
 TagInstance model
 
 id - integer PRIMARY KEY
 timestamp - integer
 tags_id - integer FOREIGN KEY
 media_type_id - integer FOREIGN KEY

=end

class TagInstance < ActiveRecord::Base

 
  belongs_to :media #foreign key - media_id
  belongs_to :tags #foreign_key -tags_id

  validate :timestamp, presence: true
  validate :media_id, presence: true
  validate :tags_id, presence: true
  
  
# Returns all instances where the search criteria matches media_id
#  Author: Jack
    def self.searchByMediaId(search)
      if search
        find(:all, :conditions => ['media_id = ?', "#{search}"])
      else
        find(:all)
      end
    end
  
  
 # Returns everything
 # Author: Jack 
    def self.getAll()
      find(:all)
    end
    
  
  
end