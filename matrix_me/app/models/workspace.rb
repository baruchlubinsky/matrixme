class Workspace
  include Mongoid::Document
  
  #field :navigation, :type => Array
  field :context, :type => Hash
  
  embeds_one :matrix_location, :as => :locatable 
  
  field :results_per_page, :type => Integer
  
  belongs_to :project
  belongs_to :user
  
  def matrix_objects
    MatrixObjects.where(:matrix_location => matrix_location)
  end
  
end