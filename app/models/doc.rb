class Doc
  include Mongoid::Document
  field :fileType, type: String
  field :versionId, type: String
  field :attribution
  field :keywords
  field :title
  field :body
  
  embedded_in :folder
  
  validates_presence_of :title
  
  def ancestors
    [folder] + folder.ancestors
  end
end
