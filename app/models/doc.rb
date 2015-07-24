class Doc
  include Mongoid::Document
  field :fileType, type: String
  field :versionId, type: String
  field :attribution
  field :keywords
  field :title
  field :body
  

end
