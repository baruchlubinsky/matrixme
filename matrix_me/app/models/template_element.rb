class TemplateElement
  include Mongoid::Document
  
  field :name, :type => String
  
  recursively_embeds_many
  
  def copy_structure(parent = self)
    target = TemplateElement.new(:name => parent.name)
    parent.child_template_elements.each do |e|
      target.child_template_elements << copy_structure(e)
    end
    return target
  end
  
end