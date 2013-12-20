=begin
 Author: Jack
 Media model
 
 id - integer PRIMARY KEY
 description - string
 path - string
 title - string
 media_type_id - integer FOREIGN KEY

=end

class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances
  
  validate :title, presence: true
  validate :path
  validate :description, presence: true
  validate :media_type_id, presence: true
  

  # Returns everything
  # Author: Jack 
  def self.getAll()
     find(:all)
  end
  

  # Returns all the media sorted by creation time
  # Author: Jack 
  def self.getAllMediaSortedByTime()
       find(:all).order("created_at").reverse_order
  end
  
  # Returns all instances of the media_id
  # Author: Jack 
  #sql = SELECT * FROM media WHERE media_id = ?;
  def self.getMediaInformationFromId(search)
    if search
      find(:all, :conditions => ['media_id = ?', "#{search}"])
    else
      find(:all)
    end
  end
  
  # Returns media_type of the file given the media_id
  # Author: Jack 
  #SELECT name FROM media_types WHERE id = (SELECT media_type_id  FROM media WHERE id =?);
  def self.getMediaTypeFromId(search)
    if search
        find(:all,
          :conditions => ['media_id = ? ', "#{search}"],
          :joins => [:media_types],
          :select => 'name')
     else
       find(:all) 
    end
  end
  
  # Returns all labels of the media's tags
  # Author: Jack 
  #SELECT label FROM tags JOIN tag_instances ON tags.id = tag_instances.tags_id WHERE media_id = ?;
  def self.getMediaTags(search)
    if search
      find(:all,
        :conditions => ['media_id = ?', "#{search}"],
        :joins => [:tags, :tag_instances],
        :select => 'label')
    else
      find(:all)
    end
  end
  
end

