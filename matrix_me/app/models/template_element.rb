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
  
  def to_tree(parent = self, indent=1)
    target = String.new(parent.name)
    target << "\n"
    parent.child_template_elements.each do |e|
      indent.times {|i| target << '-' }
      target << to_tree(e, indent + 1)
    end
    target
  end
  
  # t.traverse('', ->(a,r){a << r}){|row| row.name}
  def traverse(accumulator, collector, element = self)
    accumulator = collector.call(accumulator, yield(element) ) 
    element.child_template_elements.each do |e|       
      traverse(accumulator, collector, e) {|el| yield(el) }
    end
    accumulator
  end

  
end