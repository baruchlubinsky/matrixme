class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  
  embeds_one :template
  
  belongs_to :public_template
   
  has_many :workspaces
  
  has_many :matrix_objects
   
end