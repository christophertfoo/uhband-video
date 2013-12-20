class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances, foreign_key: :media_id
  has_many :tags, through: :tag_instances
  
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
  
  def self.getAllMediaSortedByTime()
       all.includes(:media_type).order("created_at").reverse_order
  end
  
  def self.getAllMediaID()
       select("media_id")
  end
  
  #
  # Gets the medium with the given ID and prefetches its
  # associations.
  #
  # Author: Christopher Foo
  #
  def self.getMedium(media_id)
    includes(:tags, :tag_instances, :media_type).find(media_id)
  end
  
  #
  # Gets all Media that have the tags with the given ids sorted by creation
  # time with the latest being first.
  #
  # Author: Christopher Foo
  #
  def self.searchByTags(tag_ids)
    # Find all with at least one of the tags
    resultSet = includes(:tags).joins(:tags).where(tags: {id: tag_ids}).order("media.created_at").reverse_order

    # Filter to get only those with all tags
    resultSet.select { |candidate|  (tag_ids - candidate.tags.map { |tag| tag.id }).size == 0}
  end
end

