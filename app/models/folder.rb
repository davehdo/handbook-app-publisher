class Folder
  include Mongoid::Document
  field :title, type: String
  field :attribution
  field :keywords
  # field :folder_id, type: ObjectId
  embeds_many :docs
  has_many :subfolders, class_name: "Folder", inverse_of: :parent
  belongs_to :parent, class_name: "Folder", inverse_of: :subfolders
  
  scope :top_level, -> { where(:parent_id.in => [nil, ""])}
  
  validates_presence_of :title
  
  def full_path
    (ancestors.reverse + [self]).collect {|e| e.title}.join("/")
  end
  
  def ancestors
    if parent
      [parent] + parent.ancestors
    else
      []
    end
  end
  
  # returns the folders
  def descendants
    self.subfolders.collect do |s|
      [s] + s.descendants
    end.flatten
  end
  
  def descendant_docs
    ([self] + descendants).collect {|e| e.docs }.flatten.uniq
  end
end
