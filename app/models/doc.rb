class Doc
  include Mongoid::Document
  field :fileType, type: String
  field :meta, type: Hash
end
