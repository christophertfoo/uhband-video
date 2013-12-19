class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances
  
  validate :path, presence: true
  validate :description, presence: true
  validate :creationtime, presence: true
  validate :media_type_id, presence: true
  
  def self.search(search)
     #def self.search()
      if search
        find(:all, :conditions => ['path = ?', "#{search}"])
      else
        find(:all)
      end
  end

  def self.getAll()
     find(:all)
  end
end

