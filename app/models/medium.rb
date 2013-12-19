class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances
  
  validate :title, presence: true
  validate :path
  validate :description, presence: true
  validate :media_type_id, presence: true
  
  def self.searchByPath(search)
      if search
        find(:all, :conditions => ['path like ?', "#{search}"])
      else
        find(:all)
      end
  end
  
  def self.searchById(search)
    if search
      find(:all, :conditions => ['media_id = ?', "#{search}"])
    else
      find(:all)
    end
  end
  
  def self.searchByTitle(search)
    if search
      find(:all, :conditions => ['title like ?', "#{search}"])
    else
      find(:all)
    end
  end


  def self.getAll()
     find(:all)
  end
  
  def self.getAllMediaID()
       select("media_id")
  end
end

