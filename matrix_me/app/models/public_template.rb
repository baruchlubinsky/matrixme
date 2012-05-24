class PublicTemplate < TemplateElement
  include Mongoid::Document
  
  has_many :projects
  
  def create_project_template
    project = copy_structure
    project._type = 'Template'
    project[:public_id] = id
    return project
  end  
end