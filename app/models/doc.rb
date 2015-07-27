class Doc
  include Mongoid::Document
  field :fileType, type: String
  field :versionId, type: String
  field :attribution
  field :keywords
  field :title

  embedded_in :folder
  embeds_many :sections
  
  validates_presence_of :title
  
  accepts_nested_attributes_for :sections, reject_if: proc {|e| e["title"].blank? and e["content"].blank? and e["id"].blank?}, allow_destroy: true
  
  def ancestors
    [folder] + folder.ancestors
  end
end
