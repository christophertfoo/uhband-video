class TagInstance < ActiveRecord::Base

 
  belongs_to :media #foreign key - media_id
  belongs_to :tags #foreign_key -tags_id

  validate :timestamp, presence: true
  validate :media_id, presence: true
  validate :tags_id, presence: true
  
  
    def self.search(search)
      if search
        find(:all, :conditions => ['media_id = ?', "#{search}"])
        #sql = "select * from tag_instances where id = %i" % search
        #records_array = ActiveRecord::Base.connection.execute(sql)
      else
        find(:all)
      end
  end
  
end