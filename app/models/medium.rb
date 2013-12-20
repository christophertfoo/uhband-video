class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances
  
  validate :title, presence: true
  validate :path
  validate :description, presence: true
  validate :media_type_id, presence: true
  
  def self.search(search)
      if search
        find(:all, :conditions => ['path = ?', "#{search}"])
      else
        find(:all)
      end
  end

  def self.getAll()
     find(:all)
  end
  
  def self.getAllMediaID()
       find(:all, )
  end
  
  def self.getAllMediaSortedByTime()
       find(:all).order("created_at").reverse_order
  end
  
  
  #sql = SELECT * FROM media WHERE media_id = ?;
  def self.getMediaInformationFromId(search)
    if search
      find(:all, :conditions => ['media_id = ?', "#{search}"])
    else
      find(:all)
    end
  end
  
  #sql = SELECT name FROM media_types WHERE id = (SELECT media_type_id  FROM media WHERE id =?);
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
  
  #sql = SELECT * FROM tags JOIN tag_instances ON tags.id = tag_instances.tags_id WHERE media_id = ?;
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
  
  def self.getMediaFromArrayOfTags(search)
    search.each do |t|
      t.find(:all,
      :conditions => ['tag_id = ?', "#{search}"],
      :joins => [:tags, :tag_instances])
    end
  end
  
end

