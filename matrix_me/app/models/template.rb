class Template < TemplateElement
  include Mongoid::Document
  
  field :public_id, :type => String
  
  embedded_in :project
  
end