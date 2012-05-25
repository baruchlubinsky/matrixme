class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, :type => String
  
  belongs_to :user
  
  embedded_in :conversation
  
end