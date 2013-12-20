class TagInstance < ActiveRecord::Base

 
  belongs_to :media #foreign key - media_id
  belongs_to :tags #foreign_key -tags_id

  validate :timestamp, presence: true
  validate :media_id, presence: true
  validate :tags_id, presence: true
  
  
    def self.searchByMediaId(search)
      if search
        find(:all, :conditions => ['media_id = ?', "#{search}"])
        #sql = "select * from tag_instances where id = %i" % search
        #records_array = ActiveRecord::Base.connection.execute(sql)
      else
        find(:all)
      end
    end
    
    def self.searchByTagsId(search)
      if search
        find(:all, :conditions => ['tags_id = ?', "#{search}"])
      else
        find(:all)
      end
    end
  
    def self.getAll()
      find(:all)
    end
  
end