class Doc
  include Mongoid::Document
  field :fileType, type: String
  field :versionId, type: String
  field :meta, type: Hash

end
