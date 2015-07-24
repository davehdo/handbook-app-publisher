class Folder
  include Mongoid::Document
  field :title, type: String
  # field :folder_id, type: ObjectId
  embeds_many :docs
  has_many :subfolders, class_name: "Folder", inverse_of: :parent
  belongs_to :parent, class_name: "Folder", inverse_of: :subfolders
  
  scope :top_level, -> { where(:parent_id.in => [nil, ""])}
end
