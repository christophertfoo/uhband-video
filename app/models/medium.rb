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
end

