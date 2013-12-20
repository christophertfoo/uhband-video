=begin
 Author: Jack
 MediaType model
 
 id - integer PRIMARY KEY
 name - varchar
=end

class MediaType < ActiveRecord::Base
  has_many :media
  
  validate :name, presence: true
  
    # Returns everything
    # Author: Jack 
    def self.getAll()
     find(:all)
  end
end
