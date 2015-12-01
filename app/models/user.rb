class User
  include NoBrainer::Document
  include NoBrainer::Document::Timestamps
  has_many :attendances

  field :name, :type => String
  field :github, :type => String
end
