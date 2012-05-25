class Workspace
  include Mongoid::Document
  
  #field :navigation, :type => Array
  field :context, :type => Hash
  
  embeds_one :matrix_location, :as => :locatable 
  
  field :results_per_page, :type => Integer
  
  field :zoom, :type => String, :default => 'big'
  
  belongs_to :project
  belongs_to :user
  
  field :current_object_id, :type => String
  
  def matrix_objects
    @query = MatrixObject.all
    self.matrix_location.data.each_with_index do |location, i|
      @query = @query.where("matrix_location.data.#{i}" => location)
    end
    # TODO: implement criteria
    @query.to_a
  end
  
end