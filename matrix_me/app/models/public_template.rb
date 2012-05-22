class PublicTemplate < TemplateElement
  include Mongoid::Document
  
  has_many :projects
  
  def create_project_template
    project = self.copy_structure
    project._type = 'Template'
    project[:public_id] = self.id
    return project
  end  
end