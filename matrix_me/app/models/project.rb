class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  
  embeds_one :template
  
  belongs_to :public_template
   
  has_many :workspaces
  
  has_many :matrix_objects
  
  def initialize(params = {})
    super(params)
    unless self.public_template_id.nil?
      temp = PublicTemplate.find(public_template_id)
      self.template = temp.create_project_template
    end
  end
   
end